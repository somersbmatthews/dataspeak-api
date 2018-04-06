Rails.application.routes.draw do

	

  resources :reports
  resources :sessions
  resources :tickers
	resources :users do
	  collection do
	    post 'login'
	  end
	end
	resources :holdings
	resources :portfolios
	resources :users
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
