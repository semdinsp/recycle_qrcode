require "test_helper"

class RoutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aroute=routes(:one)
  end
  test "should get index" do
    get routes_index_url
    assert_response :success
  end

  test "should get show" do
    get routes_show_url, params: { id: @aroute.id }
    assert_response :success
  end
end
