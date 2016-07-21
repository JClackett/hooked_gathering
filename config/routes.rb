Rails.application.routes.draw do
	mount Shopr::Engine => "/shop"
	
	resources :guests, except: :show

	get 'tickets', to: 'welcome#tickets'

	root 'welcome#home'

end
