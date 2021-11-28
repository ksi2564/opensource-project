Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
	
  resources :packs, only: [:index, :show]

  # get 'packs/index'
  # get 'packs/show/:id' => "packs#show"
	
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
