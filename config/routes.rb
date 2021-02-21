Rails.application.routes.draw do
  # api
  scope module: 'api' do
    namespace :v1 do
    #  get  '/teams/teams_for_user'
    #  get  '/teams/users_for_team'
    #  resources :users, only: [:create]
    #  post '/auto_login', to: "users#auto_login"
       get '/entities/checkin', to: "entities#checkin#id"
    end # v1
  end #api
  # ennd api


  namespace :admin do
      # resources :entities
      %i(
        entities actiontypes locations trucks routes
      ).each do |name|
        resources name, only: %i(index show new create edit update destroy)
      end
      root to: "entities#index"
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 resources :bins do
     resources :operation_hours, :index
     collection do
      get :googlemaps
     end
 end

  # FIX LATER
      root to: "admin/entities#index"

end
