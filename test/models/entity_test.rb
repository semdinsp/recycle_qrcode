require "test_helper"

class EntityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "creation" do
    e=Entity.new
    e.name="Fred"
    assert e.save, "couldnot save "
  end
end
