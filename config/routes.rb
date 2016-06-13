Rails.application.routes.draw do
  resources :guests
	get 'welcome/home'

	root 'welcome#home'

end
