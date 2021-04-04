class EntityCheckinAction
  extend LightService::Action
 # expects :user
  expects :entity

  promises :actiontype

  # this is primary metric
  executed do |context|
    a=Actiontype.new
    a.user="tbd"
    puts "context is #{context.inspect}"
    oldat=context.entity.most_recent_actiontype
    a.entity=context.entity
  #  a.location=context.location
    a.atype=:collection
    a.trackable=context.entity
    a.save if oldat.nil? or !oldat.today?
    a=oldat if !oldat.nil? and oldat.today?
    context.actiontype=a
    puts "actiontype created is #{a.inspect}"
    a
  end


end
