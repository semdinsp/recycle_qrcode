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
    get "/routes/show/#{@aroute.id}", params: { id: @aroute.id }
    assert_response :success
  end
  # TODO  add test for move
end
