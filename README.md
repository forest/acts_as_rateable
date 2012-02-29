ActsAsRateable
==============
A Rails 3.2 ready gem that adds rateable functionality to models.

== Gemfile
 * gem 'acts_as_rateable', :git => 'git://github.com/LessonPlanet/acts_as_taggable.git'
  
 * Create a new rails migration and add the following self.up and self.down methods
 
  def self.up
    create_table "ratings", :force => true do |t|
      t.column "rating", :integer, :default => 0
      t.column "created_at", :datetime, :null => false
      t.column "rateable_type", :string, :limit => 15, :default => "", :null => false
      t.column "rateable_id", :integer, :default => 0, :null => false
      t.column "user_id", :integer, :default => 0, :null => false
    end
  
    add_index "ratings", ["user_id"]
  end

  def self.down
    drop_table :ratings
  end
 
== Usage
 * Make you ActiveRecord model act as rateable.
 
 class Model < ActiveRecord::Base
 	acts_as_rateable
 end
 
 * Add a rating to a model instance
 
 model = Model.new
 model.rate_it, 1, current_user
 
 * Get average rating
 
 Model.last.rating
