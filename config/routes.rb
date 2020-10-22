Rails.application.routes.draw do
  
  scope path: '/show' do
    resources :map, path: '', only: [:index]
  end

  scope path: '/api' do
    api_version(module: "Api::V1", path: { value: "v1" }, defaults: { format: 'json' }) do
      resource :gps, only: [:create]
    end
  end
  mount Sidekiq::Web => '/queue'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
