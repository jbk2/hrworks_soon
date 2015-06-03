class UserMailer < ApplicationMailer
  default from: "hello@hrworks.co"

  helper :users

  def welcome_email(user)
    @user = user
    # @url = 
    mail(to: @user.email, subject: 'Welcome to Hrworks')
  end

end
