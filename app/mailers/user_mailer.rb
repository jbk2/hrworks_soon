class UserMailer < ApplicationMailer
  default from: "hello@hrworks.co"

  helper :users

  def welcome_email(user)
    @user = user
    # @url = 
    attachments.inline['hrworks_logo.png'] = File.read('images/hrworks_logo.png')
    mail(to: @user.email, subject: 'Welcome to Hrworks')
  end

end
