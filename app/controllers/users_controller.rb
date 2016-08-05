class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Welcome to #{@user.organization.preferred_name}"
    end
    render 'new'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :organization_join_code, :password, :password_confirmation)
  end
end
