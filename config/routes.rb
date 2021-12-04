Rails.application.routes.draw do
  # get 'orders/create'
  # get 'orders/show'
  # get 'carts/create'
	
  get "mypage" => "home#mypage"
	
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
	
  resources :packs, only: [:index, :show]
	
  resources :carts, only: [:create, :index, :destroy]
	
  resources :orders, only: [:create, :show, :index] do
  	resources :payments, only: [:create]
  end
	
  

  # get 'packs/index'
  # get 'packs/show/:id' => "packs#show"
	
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
