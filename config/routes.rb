Rails.application.routes.draw do
  resources :moderators, only: %i[index show create edit destroy]
  resources :recipes
  scope '/auth' do
    post '/sign-up', to: 'users#create'
    post '/sign-in', to: 'users#sign_in'
    get '/profile/:id', to: 'users#show'
    put '/update-profile/:id', to: 'users#update'
  end
  get "/status", to: "status#index"
end
