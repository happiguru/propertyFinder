Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'api/v1/users#index'
  scope module: 'api' do
    namespace :v1 do
      resources :users, only: %i[show create]
      resources :houses, only: %i[index show create]
      post 'favourites', to: 'users#favourite'
    end
  end
end
