Rails.application.routes.draw do
  namespace :admin do
      # resources :entities
      %i(
        entities actiontypes locations
      ).each do |name|
        resources name, only: %i(index show new create edit update destroy)
      end
      root to: "entities#index"
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # FIX LATER
      root to: "admin/entities#index"

end
