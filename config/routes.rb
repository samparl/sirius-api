Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  concern :api do
    resources :orders, only: [:index]
    resources :shipments, only: [:index, :show] do
      get 'summary', on: :collection
    end
  end

  namespace :v1 do
    concerns :api
  end
end
