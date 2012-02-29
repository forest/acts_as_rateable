module ActsAsRateable
  module Rateable
    def acts_as_rateable(options = {})
      class_eval do
        has_many :ratings, :as => :rateable, :dependent => :destroy, :class_name => 'ActsAsRateable::Rating'
        include ActsAsRateable::Rateable::Core
      end
    end
  end
end
