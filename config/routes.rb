Rails.application.routes.draw do
  devise_for :users
  mount ActionCable.server => '/cable'

  namespace :api do
    namespace :v1 do
      resource :login, controller: :login, only: [:create]
      resources :assistances, only: %i[create show] do
        patch :answer, on: :member
      end

      resources :users, only: %i[show]
    end

    namespace :surveillance do
      namespace :v1 do
        resources :spots, only: %i[index show]
        resources :users, only: [:show]
      end
    end
  end
end
