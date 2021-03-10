# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Setting.first.nil?
  puts "creating new settings"
  setting=Setting.new
  setting.host="https://recycle-qrcode.herokuapp.com"
  setting.port=""
  setting.centerlat= -8.5569
  setting.centerlong= 125.5603
  setting.zoom=12
  setting.save
  puts "settings now #{setting.inspect}"
else
  puts "Settings already exist:  #{Setting.first.inspect}"
end
