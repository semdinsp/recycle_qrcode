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

  test "should get tile" do
    get "/routes/tile/#{@aroute.id}", params: { id: @aroute.id }
    assert_response :success
  end

  test "should get tile all" do
    get routes_tile_all_url, params: {  }
    assert_response :success
  end

  test "should get mercy corp invoice" do
    get routes_mercycorpinvoice_path, params: {  format: :csv}
    assert_response :success
  end

  test "should get mercy corp invoice last month" do
    get routes_mercycorpinvoice_path, params: { lastMonth: "true",  format: :csv}
    assert_response :success
  end

  test "should get show csv" do
    get "/routes/show/#{@aroute.id}", params: { id: @aroute.id }, as: :csv
    assert_response :success
  end

  test "should get routes collecgtions" do
  #  jwt=get_token
  jwt="test"
  #get v1_entities_checkin_url, params: {activity_id: @activity.id  },headers: {Authorization: "Bearer #{jwt}"} , as: :json

    get routes_collections_url, params: { },headers: {Authorization: "Bearer #{jwt}"}
    assert_response :success
  end

  test "should get routes collecgtions csv" do
  #  jwt=get_token
  jwt="test"
  #get v1_entities_checkin_url, params: {activity_id: @activity.id  },headers: {Authorization: "Bearer #{jwt}"} , as: :json

    get routes_collections_url, params: { },headers: {Authorization: "Bearer #{jwt}"}, as: :csv
    assert_response :success
  end
  # TODO  add test for move
end
