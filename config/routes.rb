Rails.application.routes.draw do
	root "rants#index"

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
 
  resources :users do
 		post 'follow', to: 'users#follow', as: 'follow'
 		delete 'unfollow', to: 'users#unfollow', as: 'unfollow'
  end

  resources :rants do
  	resources :likes, only: [:create, :destroy]
  end
end
