Rails.application.routes.draw do
  
  resources :health_goals
  resources :profiles
  resources :posts

  #resources :orders do
   # collection do
    #  get :checkout
      #get :payu_return
   # end 
  #end

  resources :users , :as => :clients do
    resources :orders, only: [:index, :new, :create, :edit, :update] do
      collection do
        get :checkout
      end
    end  
  end  


  resources :profile

  resources :services do
    resources :packages
  end
  
  #devise_for :users do
  #	get '/users/sign_out' => 'devise/sessions#destroy'
  #end

  devise_for :users, :path_prefix => 'account', :controllers => {:registrations => "users/registrations"} do
  	get '/users/sign_out' => 'devise/sessions#destroy'
  end	

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get 'dashboard', to: 'home#client_dashboard'

  get 'about', to: 'home#about'

  get 'nutritionist_online', to: 'home#nutritionist_online'

  get 'services_offered', to: 'home#services'

  get 'service_details/:id', to: 'home#service_details', as: 'service_detail'

  get 'enroll_service/:id', to: 'dashboard#enroll_service', as: 'enroll_service'

  #get 'users', to: 'dashboard#users_list', as: 'users'

  get 'contact', to: 'home#contact'

  get 'blog', to: 'home#blog'

  get 'blog_post/:id', to: 'home#post', as: 'blog_post'

  #match '/payu_callback'=>'carts#payu_return'

  post '/payu_callback', to: 'orders#payu_return'
  
end
