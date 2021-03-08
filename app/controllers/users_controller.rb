class UsersController < ApplicationController
   before_action :set_user, only: [:show, :update]

  # this is the sign up stuff
  def create
    @user = User.new(user_params)
    if @user.save
      auth_token = Knock::AuthToken.new payload: { sub: @user.id }
      render json: { username: @user.username, jwt: auth_token.token }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

# this is for signing in: :)
def sign_in
  @user = User.find_by_email(params[:auth][:email])
  if @user && @user.authenticate(params[:auth][:password])
    auth_token = Knock::AuthToken.new payload: { sub: @user.id }
    render json: { username: @user.username, jwt: auth_token.token, moderator: !!@user.moderator }, status: 200
  else 
    render json: { error: 'incorrect details entered' }, status: 404
  end
end

# method for the profile page of individual user who logs in
def show
  user = User.find(params[:id])
  render json: @user
end 

# users can use this logic to update their profile
def update
  if @user.update(user_params)
    render status: :ok
  else 
  render status: bad_request
  end
end 

private

# finding the user for update and show
def set_user
  @user = User.find(params[:id])
end
# when adding in AWS will have have to add avatar back here or figure out how we will include this feature 
def user_params
  params.require(:user).permit(:username, :email, :password, :password_confirmation, :about_me, :avatar)
end

end
