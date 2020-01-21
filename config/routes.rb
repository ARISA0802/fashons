Rails.application.routes.draw do

  	post 'admin/managers' => "admin/managers#create"
	root'products#index'
	get "top" => "tops#top"
  devise_for :users, :controllers => {
  	:sessions => "users/sessions",
  	:passwords =>"users/passwords",
  	:registrations =>"users/registrations"
  }
   

  devise_for :admins, :controllers => {
  	:sessions => "admins/sessions",
  	:passwords =>"admins/passwords",
  	:registrarions =>"admins/registrations"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users,only: [:show,:edit,:update,:index,:destroy]
	resources :products,only: [:index,:show]
namespace :users do
	resources :topics,only: [:index,:show]
end
resources :images, only: [:new, :create, :index, :show] do
	resource :favorites, only: [:create, :destroy]
	resource :post_comments, only: [:create, :destroy]
end


namespace :admin do
	resources :managers,only: [:index, :show, :edit, :update, :destroy]
	resources :manager_products
	resource :office,only: [:create]
	resource :mode,only: [:create]
	resource :casual,only: [:create]
	resource :feminine,only: [:create]
end
end
