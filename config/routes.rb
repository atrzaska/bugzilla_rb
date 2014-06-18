Rails.application.routes.draw do
  root to: 'home#index'

  #FIXME zmienic scieżki
  # devise_for :users
  devise_for :users

  # match ':controller(/:action(/:id))', :via => :get
  # resources :projects, only: [:index]
  resources :projects do
    resources :stories
  end
  resources :comments
end
