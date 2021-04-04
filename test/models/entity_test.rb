require "test_helper"

class EntityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @location=locations(:one)
    @ent=entities(:one)
    @at = actiontypes(:one)
  end

  test "creation" do
    e=Entity.new
    e.name="Fred"
    assert e.save,  "could not save #{e.errors} "
    e.location=@location
    assert e.save,  "could not save #{e.errors} "
  end

  test "action type" do
    e=Entity.new
    e.name="Fred"
    assert e.save,  "could not save #{e.errors.inspect} "
    @at.trackable = e

    assert e.save,  "could not save #{e.errors.inspect} "
  end

  test "qr code" do
    assert !@ent.svg_checkin_qrcode.nil?, "qr code should not be nil"
  end

  test "qr update location code" do
    assert !@ent.svg_update_location_qrcode.nil?, "qr code should not be nil"
  end
end
