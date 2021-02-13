Rails.application.routes.draw do
  scope '/auth' do
    post '/sign-up', to: 'users#create'
    post '/sign-in', to: 'users#sign_in'
  end
end
