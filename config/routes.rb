Rails.application.routes.draw do

  # equivalent of doing GET localhost:5000/show
  scope path: '/show' do
    resources :map, path: '', only: [:index]
  end

  scope path: '/api' do
    api_version(module: "Api::V1", path: { value: "v1" }, defaults: { format: 'json' }) do
      # equivalent of doing POST localhost:5000/api/v1/gps
      resource :gps, only: [:create]
    end
  end
  mount Sidekiq::Web => '/queue'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
