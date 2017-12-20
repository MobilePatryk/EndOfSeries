Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  root :to => 'ends#index'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  get "/codeupdate" => "ends#codeupdate"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
