Rails.application.routes.draw do
  get 'routes/index'
  get 'routes/collections'
  get 'routes/mercycorpinvoice'

  # scott original get 'routes/show'
  get 'routes/show/:id' => "routes#show#:id(.:format)"
  get 'routes/tile/:id' => "routes#tile#:id(.:format)"


  patch 'routes/move/:id' => "routes#move#:id(.:format)"

  # api
  scope module: 'api' do
    namespace :v1 do
    #  get  '/teams/teams_for_user'
    #  get  '/teams/users_for_team'
    #  resources :users, only: [:create]
    #  post '/auto_login', to: "users#auto_login"
       get '/entities/checkin', to: "entities#checkin#id"
       post '/entities/checkin_set_location', to: "entities#checkin_location_set"

    end # v1
  end #api
  # ennd api


  namespace :admin do
      # resources :entities
      %i(
        entities actiontypes locations trucks routes kv_pairs route_members
      ).each do |name|
        resources name, only: %i(index show new create edit update)
      end
      resources :settings, only: %i(index show edit update)
      root to: "entities#index"
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 resources :bins do
     # resources :operation_hours, :index

     get 'report' => "bins#report#:id(.:format)"
     get 'collectmap' => "bins#collectmap#:id(.:format)"
     get 'collectpoints' => "bins#collectpoints#:id(.:format)"

     collection do
      get :googlemaps, :routemaps
      #get 'report/:id' => "bins#report#:id(.:format)"
     end
 end

  # FIX LATER
      root to: "bins#googlemaps"

end
