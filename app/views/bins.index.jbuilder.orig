json.array! @bins do |store|
  json.lat store.location.latitude
  json.lng store.location.longitude
  json.title store.name
  json.content StoresController.render(partial: 'bins/bins', locals: { bin: store}, format: :html).squish
end
