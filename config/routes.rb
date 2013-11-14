ShoeSales::Application.routes.draw do
  get "/register", :to => 'users#new'
  post "/register", :to => 'users#create'

  get "/login", :to => 'sessions#new'
  post "/login", :to => 'sessions#create'
  delete "/logout", :to => 'sessions#destroy'

  resources :users, :only => [:new, :create, :show]
  post "/users/:id", :to => 'users#show'	#post for product 'edit' function

  resources :products, :only => [:index, :create, :update, :destroy]

  root :to => 'sessions#new'
end
