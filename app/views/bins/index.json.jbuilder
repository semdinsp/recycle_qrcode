json.array! @bins do |store|
  json.lat store.location.latitude
  json.lng store.location.longitude
  json.name store.name
  json.etype store.etype
  json.content BinsController.render(partial: 'bins/bins', locals: { bin: store }, format: :html).squish
end
