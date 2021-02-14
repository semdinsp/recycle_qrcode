class EntityCheckinAction
  extend LightService::Action
 # expects :user
  expects :entity, :location

  promises :actiontype

  # this is primary metric
  executed do |context|
    a=Actiontype.new
    a.user="fred"
    puts "context is #{context.inspect}"
    a.entity=context.entity
    a.location_id=context.location.id

    context.actiontype=a
    a.save
    puts "actiontype created is #{a.inspect}"
    a
  end


end
