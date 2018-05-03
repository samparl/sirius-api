Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  concern :api do
    resources :orders, :shipments
  end

  namespace :v1 do
    concerns :api
  end
end
