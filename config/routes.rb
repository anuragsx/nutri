Rails.application.routes.draw do
  
  resources :posts
  resources :services
  #devise_for :users do
  #	get '/users/sign_out' => 'devise/sessions#destroy'
  #end

  devise_for :users, :controllers => {:registrations => "users/registrations"} do
  	get '/users/sign_out' => 'devise/sessions#destroy'
  end	

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get 'dashboard', to: 'home#client_dashboard'

  get 'about', to: 'home#about'

  get 'nutritionist_online', to: 'home#nutritionist_online'

  get 'services', to: 'home#services'

  get 'service_details', to: 'home#service_details'

  get 'contact', to: 'home#contact'
  
end
