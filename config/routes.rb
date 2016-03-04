Rails.application.routes.draw do
  root :to => 'welcome#index'

  get 'welcome/index'

  get 'welcome/about'

  devise_for :users

  resources :users, only: [:show] do
    resources :items, only: [:create, :destroy]
  end


end
