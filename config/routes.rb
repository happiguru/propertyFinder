Rails.application.routes.draw do
  root to: 'api/v1/users#index'
  namespace :'api', defaults: { format: :json} do
    namespace :v1 do
      resources :users, only: %i[create show]
      resources :houses, only: %i[index show create]
      post 'favourites', to: 'users#new_favourite'
      # resources :tokens, only: %i[create]

      post "/login", to: "users#login"
      get "/auto_login", to: "users#auto_login"
    end
  end
end