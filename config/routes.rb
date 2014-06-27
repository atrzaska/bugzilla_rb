Rails.application.routes.draw do
  resources :posts

  # match ':controller(/:action(/:id))', :via => :get

  authenticated :user do
    root :to => 'projects#index', as: :authenticated_root
  end
  root :to => 'home#index'
5
  #FIXME zmienic scieżki
  # devise_for :users
  devise_for :users

  get 'members/confirm/:token' => 'members#confirm', as: 'confirm_member'

  resources :projects do
    resources :members
    resources :stories do
      get :current, :backlog, :icebox, :done, on: :collection
    end
  end
end
