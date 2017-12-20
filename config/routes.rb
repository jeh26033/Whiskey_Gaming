Rails.application.routes.draw do
  
  	root 'static_pages#home'

	get '/home', to: 'static_pages#home'

	get '/help', to: 'static_pages#help'

	get '/about', to: 'static_pages#about'

	get '/teams', to: 'static_pages#teams'

	get '/news', to: 'static_pages#news'

	get '/leaderboards', to: 'matches#index'

	match '/auth/:provider/callback', to: 'sessions#create', via: :all

	delete '/logout', to: 'sessions#destroy', as: :logout
	
	resources :matches, only: [:index, :show]

	

	resources :articles

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
