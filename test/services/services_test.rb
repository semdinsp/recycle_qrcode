require "test_helper"

class ServicesTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
  # @entity=entities(:one
  #puts "IN SETUP"
  @location=locations(:one)
  @entity=entities(:one)
  puts "SETUP Done"
  end

  test "creation" do
      puts "service creation"
      assert_difference('Actiontype.count', 1) do
        ctx = EntityCheckinAction.execute(entity: @entity, location: @location)
      end
  end # creation
end
