Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :places, only: [:new, :create, :show, :edit, :update, :destroy, :index]
    resources :trips
    resources :countries

    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    post '/logout' => 'sessions#destroy'
    get '/auth/github/callback' => 'sessions#omniauth'
  
    resources :users, only: [:new, :create, :show]

    resources :users, only: [:show] do
      resources :places, only: [:index]
    end

    root 'welcome#home'
end
