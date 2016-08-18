class UsersController < ApplicationController

  def index
    redirect_to :back
  end

  def new
    website
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = "Welcome to #{@user.organization.preferred_name}"
      redirect_to @user.organization
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :organization_join_code, :password, :password_confirmation)
  end
end
