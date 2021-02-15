Rails.application.routes.draw do
  scope '/auth' do
    post '/sign-up', to: 'users#create'
    post '/sign-in', to: 'users#sign_in'
    get '/profile/:id', to: 'users#show'
    put '/update-profile/:id', to: 'users#update'
  end
  get "/status", to: "status#index"
end
