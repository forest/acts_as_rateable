require "active_record"
require "active_record/version"

$LOAD_PATH.unshift(File.dirname(__FILE__))

require "acts_as_rateable/rateable.rb"
require "acts_as_rateable/acts_as_rateable/core.rb"
require "acts_as_rateable/rating.rb"

$LOAD_PATH.shift

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend ActsAsRateable::Rateable
end
