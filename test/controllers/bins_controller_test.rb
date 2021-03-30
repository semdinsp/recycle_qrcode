require "test_helper"

class BinsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do

    @location=locations(:one)
    @entity=entities(:one)
    @at=actiontypes(:one)

  end

  test "should get bins" do
  #  jwt=get_token
  jwt="test"
  #get v1_entities_checkin_url, params: {activity_id: @activity.id  },headers: {Authorization: "Bearer #{jwt}"} , as: :json

    get bins_url, params: {icon: 'normal' },headers: {Authorization: "Bearer #{jwt}"} , as: :json
    assert_response :success
  end

  test "should get bins route" do
  #  jwt=get_token
  jwt="test"
  #get v1_entities_checkin_url, params: {activity_id: @activity.id  },headers: {Authorization: "Bearer #{jwt}"} , as: :json

    get bins_url, params: {icon: 'route' },headers: {Authorization: "Bearer #{jwt}"}, as: :json
    assert_response :success
  end

  test "should get bins routemaps" do
  #  jwt=get_token
  jwt="test"
  #get v1_entities_checkin_url, params: {activity_id: @activity.id  },headers: {Authorization: "Bearer #{jwt}"} , as: :json

    get routemaps_bins_url, params: { },headers: {Authorization: "Bearer #{jwt}"}
    assert_response :success
  end

  test "should get bins report" do
  #  jwt=get_token
  jwt="test"
  #get v1_entities_checkin_url, params: {activity_id: @activity.id  },headers: {Authorization: "Bearer #{jwt}"} , as: :json

    get bin_report_url(bin_id: @entity.id), params: { },headers: {Authorization: "Bearer #{jwt}"}
    assert_response :success
  end

test "should get bins googlemaps" do
#  jwt=get_token
jwt="test"
#get v1_entities_checkin_url, params: {activity_id: @activity.id  },headers: {Authorization: "Bearer #{jwt}"} , as: :json

  get googlemaps_bins_url, params: { },headers: {Authorization: "Bearer #{jwt}"}
  assert_response :success
end
end
