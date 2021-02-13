Rails.application.routes.draw do

  post '/sign-up', to: 'users#create'

end
