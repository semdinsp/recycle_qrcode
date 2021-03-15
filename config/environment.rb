# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!
if ActiveRecord::Base.connection.table_exists? 'settings'
  SETTINGS=Setting.first
  puts "System settings:"
  puts SETTINGS.inspect if !Setting.first.nil?
end
