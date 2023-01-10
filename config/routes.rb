Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resource :customer, only: [] do
        resources :subscriptions, only: [:index]
      end
      resources :customer_subscriptions, only: [:create, :update]
    end
  end
end
