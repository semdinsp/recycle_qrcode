require 'test_helper'

class EntitiesControllerTest < ActionDispatch::IntegrationTest
  setup do

    @location=locations(:one)
    @entity=entities(:one)


  end


  test "should get checkin" do
  #  jwt=get_token
  jwt="test"
  #get v1_entities_checkin_url, params: {activity_id: @activity.id  },headers: {Authorization: "Bearer #{jwt}"} , as: :json

    get v1_entities_checkin_url, params: {id: @entity.id  },headers: {Authorization: "Bearer #{jwt}"} , as: :json
    assert_response :success
  end






end
