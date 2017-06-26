Rails.application.routes.draw do
  resources :messages
	resources :users
	resources :sessions, only: [:new , :create]
	get 'home/index'
	#/sessions/new
 	#/sections/create
  
	root "home#index"
	delete 'log_out' => 'sessions#destroy'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
