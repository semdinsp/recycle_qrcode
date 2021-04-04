require "test_helper"

class ActiontypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @location=locations(:one)
    @entity=entities(:one)
    @entity.location=@location
#puts "End Setup"
  end

  test "creation" do
  #  puts "start creationn"
    e=Actiontype.new
    e.atype=:collection
    e.user="fred"
   puts "before first save"
    assert !e.save, "could not save #{e.errors.inspect} without location "
    e.entity=@entity
    @entity.location=@location
  #  e.location_id=@location.id
    e.location= @location
    puts "enntity #{@entity.inspect} actiontype #{e.inspect}"
    puts "before second save"
    assert !e.save, "could not save #{e.errors.inspect} without location "

  end

  test "creation trackable" do
  #  puts "start creationn"
    e=Actiontype.new
    e.atype=:collection
    e.user="fred"
   puts "before first save"
    assert !e.save, "could not save #{e.errors.inspect} without location "
    e.entity=@entity
    @entity.location=@location
  #  e.location_id=@location.id
    e.trackable=@entity
    e.location= @location
    puts "enntity #{@entity.inspect} actionntype #{e.inspect}"
    puts "before second save"
    assert e.save, "could not save #{e.errors.inspect} without location "

  end

end
