Rails.application.routes.draw do
  resources :curators do
    resources :collections
  end

  resources :artworks, only: [:new, :create, :search, :results, :show]

  get '/search' => 'artwork#new'
  post '/search' => 'artwork#search'
  get '/results' => 'artwork#results'
  post '/create' => 'artwork#create'
  get '/show' => 'artwork#show'

  root 'curators#index'

  get 'sessions/new' => 'sessions#new', as: 'log_in'
  post 'sessions' => 'sessions#create'
  get 'sessions/goodbye' => 'sessions#destroy'
  delete 'sessions' => 'sessions#destroy', as: 'log_out'

  get 'profiles' => 'profiles#index'
end
