class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:update]

  def index
    @users = User.all.order('LOWER(first_name) ASC')
  end
  
  def update
    @user.update(user_params)
  end

private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:admin, :beta)
  end
end
