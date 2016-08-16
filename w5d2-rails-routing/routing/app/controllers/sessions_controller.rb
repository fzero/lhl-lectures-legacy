class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to :root
    else
      flash[:error] = "Wrong email or password"
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "You've been logged out!"
    redirect_to new_session_path
  end

end
