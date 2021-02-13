Rails.application.routes.draw do

  post '/sign-up', to: 'users#create'
  post '/sign-in', to: 'users#sign_in'
end
