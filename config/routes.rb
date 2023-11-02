Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :users do
      resource :login, controller: :login, only: [:create]
    end

    namespace :surveillance do
      resources :spots, only: [:index]
    end

    mount ActionCable.server => "/cable"
  end
end
