Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :places
    resources :trips
    resources :countries

    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    post '/logout' => 'sessions#destroy'
  
    resources :users, only: [:new, :create]

    root 'welcome#home'
end
