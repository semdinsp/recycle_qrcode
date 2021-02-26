json.array! @bins do |store|
  if !store.location.nil? then
     json.lat store.location.latitude
     json.lng store.location.longitude
     json.content BinsController.render(partial: 'bins/bins', locals: { bin: store }, format: :html).squish
   end
  json.iconcolor store.iconcolor
  json.name store.name
  json.etype store.etype
end
