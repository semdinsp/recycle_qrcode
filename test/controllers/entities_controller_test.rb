require 'test_helper'

class EntitiesControllerTest < ActionDispatch::IntegrationTest
  setup do

    @location=locations(:one)
    @entity=entities(:one)
    @at=actiontypes(:one)

  end


  test "should get checkin" do
  #  jwt=get_token
  jwt="test"
  #get v1_entities_checkin_url, params: {activity_id: @activity.id  },headers: {Authorization: "Bearer #{jwt}"} , as: :json

    get v1_entities_checkin_url, params: {id: @entity.id  },headers: {Authorization: "Bearer #{jwt}"} , as: :json
    assert_response :success
  end

  test "should get checkin json" do
  #  jwt=get_token
  jwt="test"
  #get v1_entities_checkin_url, params: {activity_id: @activity.id  },headers: {Authorization: "Bearer #{jwt}"} , as: :json

    get v1_entities_checkin_url, params: {format: :json, id: @entity.id  },headers: {Authorization: "Bearer #{jwt}"} , as: :json
    assert_response :success
  end

  test "should  checkin set location json" do
  #  jwt=get_token
  jwt="test"
  #get v1_entities_checkin_url, params: {activity_id: @activity.id  },headers: {Authorization: "Bearer #{jwt}"} , as: :json
    assert_difference('Location.count',1) do
       post v1_entities_checkin_set_location_url, params: {format: :json, actiontype: @at.id, latitude: -8, longitude: 125 , accuracy: '20' },headers: {Authorization: "Bearer #{jwt}"} , as: :json
       assert_response :success
    end
    assert @at.location.latitude==-8, "set latitude tolocation"
  end

  test "should get update location " do
  #  jwt=get_token
  jwt="test"
  #get v1_entities_checkin_url, params: {activity_id: @activity.id  },headers: {Authorization: "Bearer #{jwt}"} , as: :json

    get v1_entities_update_location_url, params: { id: @entity.id  },headers: {Authorization: "Bearer #{jwt}"}
    assert_response :success
  end

  test "should  update entity location " do
  #  jwt=get_token
  jwt="test"
  #get v1_entities_checkin_url, params: {activity_id: @activity.id  },headers: {Authorization: "Bearer #{jwt}"} , as: :json
    assert_difference('Location.count',1) do
       post v1_entities_update_entity_location_url, params: {format: :json, entity: @entity.id, latitude: -22, longitude: 125 , accuracy: '20' },headers: {Authorization: "Bearer #{jwt}"} , as: :json
       assert_response :success
    end
    assert @entity.location.latitude==-22, "set latitude tolocation #{@entity.inspect}"
  end



end
