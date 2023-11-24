Rails.application.routes.draw do
  devise_for :users
  mount ActionCable.server => "/cable"

  root "pages#home"

  post "/hello", to: "pages#hello"

  namespace :api do
    namespace :v1 do
      resource :login, controller: :login, only: [:create]
    end

    namespace :surveillance do
      namespace :v1 do
        resources :spots, only: [:index, :show]
        resources :users, only: [:show]
      end
    end

  end
end
