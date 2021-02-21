require "test_helper"

class EntityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @location=locations(:one)
    @ent=entities(:one)
  end

  test "creation" do
    e=Entity.new
    e.name="Fred"
    assert e.save,  "could not save #{e.errors} "
    e.location=@location
    assert e.save,  "could not save #{e.errors} "
  end
  test "qr code" do
    assert !@ent.svg_checkin_qrcode.nil?, "qr code should not be nil"
  end
end
