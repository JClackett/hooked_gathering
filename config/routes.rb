Rails.application.routes.draw do
	devise_for :users
	devise_scope :user do 
		get 'login', to: "devise/sessions#new"
		get 'register', to: "devise/registrations#new"

	end
	
	resources :guests

	get 'tickets', to: 'welcome#tickets'

	root 'welcome#home'

end
