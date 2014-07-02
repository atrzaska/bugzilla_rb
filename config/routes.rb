Rails.application.routes.draw do
  authenticated :user do
    root :to => 'projects#index', as: :authenticated_root
  end

  root :to => 'home#index'

  devise_for :users, controllers: { confirmations: 'confirmations' }

  get 'members/confirm/:token' => 'members#confirm', as: 'confirm_member'

  resources :projects, only: [:index, :new, :edit, :create, :update, :destroy] do
    resources :members, only: [:index, :show, :new, :edit, :create, :update, :destroy]
    resources :stories, only: [:show, :new, :edit, :create, :update, :destroy] do
      get :current, :backlog, :icebox, :done, on: :collection
    end
  end
end
