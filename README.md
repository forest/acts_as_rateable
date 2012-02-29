ActsAsRateable
==============
A Rails 3.2 ready gem that adds rateable functionality to models.

## Install
* gem 'lessonplanet-acts_as_rateable', :require => 'acts_as_rateable'
* Create a new rails migration and add the following self.up and self.down methods
 
```ruby
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
```
 
## Usage

Make you ActiveRecord model act as rateable:

```ruby
 class Model < ActiveRecord::Base
 	acts_as_rateable
 end
```
 
Add a rating to a model instance:

```ruby
 object.rate_it, 1, current_user
```
 
Get average rating:

```ruby
 Model.last.rating
```
