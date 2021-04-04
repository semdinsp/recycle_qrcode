require "test_helper"

class RouteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @at = actiontypes(:one)
    @route=routes(:one)
    @truck=trucks(:one)
  end

  test "action type" do
    e=Route.new
    e.name="Fred"
    e.truck=@truck
    assert e.save,  "could not save #{e.errors}  #{e.errors.inspect} "
    assert e.actionevents.size == 0, "should have not trackable item"

    @at.trackable=e
    @at.save
  #  e.events << @at
    assert e.save,  "could not save after event adding #{e.errors} #{e.errors.inspect} "
    assert e.actionevents.size == 0, "should not have trackable item"
    e.reload
    assert e.actionevents.size > 0, "should have trackable item"

  end

  test "action type with append" do
    e=Route.new
    e.name="Fred"
    e.truck=@truck
    assert e.save,  "could not save #{e.errors}  #{e.errors.inspect} "
    assert e.actionevents.size == 0, "should have not trackable item"
    e.actionevents << @at

  #  e.events << @at
    assert e.save,  "could not save after event adding #{e.errors} #{e.errors.inspect} "
    assert e.actionevents.size > 0, "should have trackable item"
  end
end
