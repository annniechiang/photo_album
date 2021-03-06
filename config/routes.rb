Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "photo2s#index"
  resources :photo2s
  resources :users

  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      post "/login" => "auth#login"
      post "/logout" => "auth#logout"
      
      resources :photos, only: [:index, :create, :show, :update, :destroy]
    end
  end

end
