require "test_helper"

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
  # @entity=entities(:one
  #puts "IN SETUP"
    @ent=entities(:one)
    @loc=locations(:one)
    @at=actiontypes(:one)

    @ent.location=@loc
    @ent.save
  end

  test "creation" do
    #puts "AFTER START"
    e=Location.new
#    e.entity=entity
    f=Entity.new
#    e.entity=f
  #  @entity.location=e
    e.longitude=3.4
    e.latitude=3.4
    f.location=e
#puts "BEFOREE SAVE"
    assert e.save,  "could not save #{e.errors.inspect} "
    assert f.location==e, "location shold be entity location"
  end

  test "update location from web params entity" do
     params={}
     params['longitude']=44
     params['latitude']=3
     params['accuracy']=55
     f=Entity.new

     assert_difference('Location.count', 1) do
       loc= Location.create_from_params(params,f)
       assert loc.accuracy=="55", "accuracy should be set #{loc.inspect}"
       assert loc.longitude==44, "long should be set #{loc.inspect}"
       assert loc.latitude==3, "lat should be set #{loc.inspect}"
       assert !loc.id.nil?, "location shold be saved #{loc.inspect}"

    end
  end

  test "update location from web params actiontype" do
     params={}
     params['longitude']=44
     params['latitude']=3
     params['accuracy']=55
     assert_difference('Location.count', 1) do
       loc= Location.create_from_params(params,@at)
       assert loc.accuracy=="55", "accuracy should be set #{loc.inspect}"
       assert loc.longitude==44, "long should be set #{loc.inspect}"
       assert loc.latitude==3, "lat should be set #{loc.inspect}"
       assert !loc.id.nil?, "location shold be saved #{loc.inspect}"
    end
  end


  test "distance test" do
    assert @loc.haversine_distance(nil)==100000.0, "100000 when compared to nil"
    e=Location.new
    f=Entity.new
    e.latitude= -8.51
    e.longitude= 125.56

    f.location=e
    puts "DISTANCE "  << @loc.haversine_distance(e).to_s
    assert @loc.haversine_distance(e)< 10, "locatin should be close "
  end
end
