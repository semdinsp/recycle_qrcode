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
    a.location=context.location
    a.atype=:collection
    oldat=context.entity.most_recent_actiontype
    a.save if oldat.nil? or !oldat.today?
    a=oldat if oldat.today?
    context.actiontype=a
    puts "actiontype created is #{a.inspect}"
    a
  end


end
