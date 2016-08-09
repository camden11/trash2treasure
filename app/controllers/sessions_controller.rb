class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to current_user.organization
    end
  end

  def create
    return if logged_in?
    user = User.find_by(email: session_params[:email].downcase)
    if user && user.authenticate(session_params[:password])
      log_in user
      remember user
      redirect_back_or user.organization
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
