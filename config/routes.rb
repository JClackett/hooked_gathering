Rails.application.routes.draw do
	mount Shopr::Engine => "/shop"
	
	resources :guests, except: :show

	get 'tickets', to: 'welcome#tickets'

	root 'welcome#home'

	get "products/:permalink", to: "products#show", as: "product"
	post "products/:permalink", to: "products#buy", as: "buy"
	get 'products', to: "products#index"
	get "basket", to: "orders#show"
	delete "basket", to: "orders#destroy"

  	match "checkout", to: "orders#checkout", as: "checkout", via: [:get, :patch]
	match "checkout/confirm", to: "orders#confirmation", as: "checkout_confirmation", via: [:get, :post]


end
