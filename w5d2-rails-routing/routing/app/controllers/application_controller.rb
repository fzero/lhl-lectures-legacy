class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def check_login
    unless @user = User.find_by(id: session[:user_id])
      flash[:notice] = "You must be logged in"
      redirect_to login_path
    end
  end

  def check_admin
    unless @user && @user.admin?
      flash[:notice] = "You must be an admin, sneaky bastard!"
      redirect_to login_path
    end
  end
end
