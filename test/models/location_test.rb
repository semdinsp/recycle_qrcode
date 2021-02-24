require "test_helper"

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
  # @entity=entities(:one
  #puts "IN SETUP"
  end

  test "creation" do
    #puts "AFTER START"
    e=Location.new
#    e.entity=entity
    f=Entity.new
#    e.entity=f
  #  @entity.location=e
    e.longitude=3.4
    e.latitude=3.4
    f.location=e
#puts "BEFOREE SAVE"
    assert e.save,  "could not save #{e.errors.inspect} "
    assert f.location==e, "location shold be entity location"
  end
end
