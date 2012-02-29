module ActsAsRateable::Rateable
  module Core
    def self.included(base)
      base.send :include, ActsAsRateable::Rateable::Core::InstanceMethods
      base.extend ActsAsRateable::Rateable::Core::ClassMethods
    end

    module ClassMethods
      # Helper method to lookup for ratings for a given object.
      # This method is equivalent to obj.ratings
      def ratings_for(obj)
        rateable = ActiveRecord::Base.send(:class_name_of_active_record_descendant, self).to_s
        scoped(
          :conditions => { :rateable_id => obj.id, :rateable_type => rateable },
          :order => 'created_at DESC'
        )
      end
      
      # Helper class method to lookup ratings for
      # the mixin rateable type written by a given user.  
      # This method is NOT equivalent to Rating.find_ratings_for_user
      def ratings_by_user(user) 
        rateable = ActiveRecord::Base.send(:class_name_of_active_record_descendant, self).to_s
        scoped(
          :conditions => { :user_id => user.id, :rateable_type => rateable },
          :order => 'created_at DESC'
        )
      end
    end

    module InstanceMethods
      # Helper method that defaults the current time to the submitted field.
      def rate_it(rating, user)
        ratings.where(:user_id => user.id).delete_all if user.present?
        ratings << ActsAsRateable::Rating.new(:rating => rating.to_i, :user_id => user.try(:id))
      end
      
      # Helper method that returns the average rating
      def rating
        ratings.average(:rating).to_f
      end
      
      # Check to see if a user already rated this rateable
      def rated_by_user?(user)
        ratings.where(:user_id => user.id).count > 0
      end
    end
  end
end
