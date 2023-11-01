Rails.application.routes.draw do
  namespace :api do

    namespace :users do
      resource :login, controller: :login, only: [:create]
    end

    constraints subdomain: "observador" do
      namespace :surveillance do
        resources :cameras, only: [:index]
      end
    end

    mount ActionCable.server => "/cable"
  end
end
