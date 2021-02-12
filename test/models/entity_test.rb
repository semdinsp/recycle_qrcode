require "test_helper"

class EntityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @location=locations(:one)
  end

  test "creation" do
    e=Entity.new
    e.name="Fred"
    assert e.save,  "could not save #{e.errors} "
    e.location=@location
    assert e.save,  "could not save #{e.errors} "
  end
end
