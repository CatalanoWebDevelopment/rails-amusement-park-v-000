Rails.application.routes.draw do
    root "application#home"
    
    get '/signin', :to => 'sessions#new'
    post '/sessions/create', :to => 'sessions#create'
    get '/signout', :to => 'sessions#destroy'
    
    get '/rides/new', :to => 'rides#new'
    post '/rides/new', :to => 'rides#new'
    
    resources :attractions
    resources :users
end