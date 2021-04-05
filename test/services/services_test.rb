require "test_helper"

class ServicesTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
  # @entity=entities(:one
  #puts "IN SETUP"
  @location=locations(:one)
  @entity=entities(:two)
  puts "SETUP Done"
  end

  test "creation" do
      puts "service creation"
      assert_difference('Actiontype.count', 1) do
        ctx = EntityCheckinAction.execute(entity: @entity, location: @location)
      end
  end # creation

  test "test empty creation" do
      puts "service creation"
      fred=Entity.new
      fred.save
      assert_difference('Actiontype.count', 1) do
        ctx = EntityCheckinAction.execute(entity: fred, location: @location)
      end
      assert_difference('Actiontype.count', 0) do
        # only create one per day
        ctx = EntityCheckinAction.execute(entity: fred, location: @location)
      end
      at=fred.actiontypes.collected.first
      at.created_at = Time.now - 6.days
      at.save
      assert_difference('Actiontype.count', 1) do
        # only create one per day
        ctx = EntityCheckinAction.execute(entity: fred, location: @location)
      end

  end # creation
end
