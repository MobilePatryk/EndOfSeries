Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'
  get 'data', to: 'analytics#data'
  get 'users/:id/edit', to: 'user#edit'
  post 'users/:id/edit', to: 'user#update' 
  get 'account_summaries', to: 'analytics#account_summaries'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :sports

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  root to: "home#show"

 get "/koniec-serii" => 'ends#index'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  get "/codeupdate" => "ends#codeupdate"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
