Rails.application.routes.draw do
  # match ':controller(/:action(/:id))', :via => :get

  authenticated :user do
    root :to => 'projects#index', as: :authenticated_root
  end
  root :to => 'home#index'
5
  #FIXME zmienic scieżki
  # devise_for :users
  devise_for :users

  resources :projects, only: [:index, :new] do
    resources :stories, only: [:index, :new]
  end
  resources :comments, only: [:index, :new]
end
