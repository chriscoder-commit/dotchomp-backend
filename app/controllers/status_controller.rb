class StatusController < ApplicationController
before_action :authenticate_user

def index
    render json: { moderator: current_user.moderator }
end
end
