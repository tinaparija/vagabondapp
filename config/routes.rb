Rails.application.routes.draw do
	root to: 'users#index'

	get '/users/new', to: 'users#new', as: 'new_user'
	post '/users', to: 'users#create'
	get '/users/:id', to: 'users#show', as: 'user'
	get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
	patch '/users/:id', to: 'users#update'
	delete '/users/:id', to: 'users#destroy'

	get '/cities', to: 'cities#index'

	get '/users/:id/posts', to: 'users#posts'
	get '/posts/:id', to: 'posts#show', as: 'post'

	get '/login', to: 'sessions#new'
	get '/logout', to: 'sessions#destroy'
	post '/sessions', to: 'sessions#create'

end
