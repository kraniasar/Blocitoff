Rails.application.routes.draw do

  get 'welcome/index'

  get 'welcome/about'

  get 'users/show'

  devise_for :users

  root 'welcome#index'

end
