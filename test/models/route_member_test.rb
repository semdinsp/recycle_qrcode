require "test_helper"

class RouteMemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @ent = entities(:one)
    @route = routes(:one)
  end

  test "creation" do
    e=RouteMember.new
    e.position=2
    assert !e.save,  "should not save #{e.errors.inspect} "
    e.entity=@ent
    e.route= @route
    assert e.save,  "could not save #{e.errors.inspect} "

  end
end
