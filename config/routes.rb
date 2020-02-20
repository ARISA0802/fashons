Rails.application.routes.draw do
  	post 'admin/managers' => "admin/managers#create"
	root 'products#index'
	get "top" => "tops#top"
	post 'user/topic'=> 'users/topics#create'
	get 'user/topic'=> 'users/topics#index'
	post "topics/comment" => "topics#comment"
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
resources :products,only: [:index,:show] do
	resource :favorites, only: [:new,:create, :destroy]
end
resources :users,only: [:show,:edit,:update,:index,:destroy]do
	resources :favorites,only: [:index]
end
namespace :users do
	resources :topics,only: [:show,:edit,:update,:destroy,:create,:new]
end
resources :images, only: [:new, :create, :index, :show] do
	resource :favorites, only: [:index]
	resource :post_comments, only: [:create, :destroy]
end


namespace :admin do
	resources :managers,only: [:index, :show, :edit, :update, :destroy,:new]
	resources :manager_products,only:[:index, :show, :edit, :update, :destroy, :new, :create]
	resource :office,only: [:create]
	resource :mode,only: [:create]
	resource :casual,only: [:create]
	resource :feminine,only: [:create]
end
end
