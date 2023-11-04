Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resource :login, controller: :login, only: [:create]
    end

    namespace :surveillance do
      namespace :v1 do
        resources :spots, only: [:index]
        resources :users, only: [:show]
      end
    end

    mount ActionCable.server => "/cable"
  end
end
