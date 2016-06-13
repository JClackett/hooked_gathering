Rails.application.routes.draw do
	devise_for :users
	devise_scope :user do 
		get 'register', to: "devise/registrations#new"
		get 'login', to: "devise/sessions#new"
	end

	resources :guests

	root 'welcome#home'

end
