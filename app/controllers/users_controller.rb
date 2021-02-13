class UsersController < ApplicationController

  # this is the sign up stuff
def create
  @user = User.create(user_params)

  if @user.save
    auth_token = Knock::AuthToken.new payload: { sub: @user.id }
    render json: { username: @user.username, jwt: auth_token.token }, status: :created
  else
    render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
  end 
end

# this is for signing in:
def sign_in
  @user = User.find_by_email(params[:auth][:email])
  
  if @user && @user.authenticate(params[:auth][:email])
    auth_token = Knock::AuthToken.new payload: { sub: @user.id }
    render json: { username: @user.username, jwt: auth_token.token }, status: 200
  else 
    render json: { error: 'incorrect details entered' }, status: 404
  end
end

# method for the profile page of individual user who logs in
def show
  user = User.find(params[:id])
  render json: @user
end 

def update
  if @user.update(user_params)
    render status: :ok
  else 
  render status: bad_request
  end
end 

private

def user_params
  params.require(:user).permit(:username, :email, :password, :password_confirmation, :about_me)
end

end
