module ActsAsRateable
  class Rating < ActiveRecord::Base
    belongs_to :rateable, :polymorphic => true, :touch => true
    belongs_to :user, :touch => true
  end
end
