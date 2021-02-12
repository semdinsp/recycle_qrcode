class EntityCheckinAction
  extend LightService::Action
 # expects :user
  expects :entity,:location
  
  promises :actiontype
  
  # this is primary metric
  executed do |context|
    a=Actiontype.new
    a.user="fred"
    a.entity=context.entity
    a.location_id=context.location.id
    
    context.actiontype=a
    a.save 
    puts "actiotype created is #{a.inspect}"
  
     m
  end
  
  
end
