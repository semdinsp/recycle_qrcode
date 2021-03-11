json.array! @bins do |store|
  if !store.location.nil? then
     json.lat store.location.latitude
     json.lng store.location.longitude
     json.content BinsController.render(partial: 'bins/bins', locals: { bin: store }, format: :html).squish
   end
   if store.class==Actiontype
     json.iconcolor 'yellow'
     json.name "Collection #{store.created_at}"
   else
     json.iconcolor store.iconcolor
     json.name store.name

   end
end
