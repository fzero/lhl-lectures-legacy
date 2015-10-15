class UserMailer < ApplicationMailer

  def welcome_email(user, welcome_text=nil)
    @user = user
    @welcome_text = welcome_text || "You are the most awesome evah!"
    mail(to: @user.email, subject: "Welcome to Initrode, #{@user.first_name}!")
  end

end
