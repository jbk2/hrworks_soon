class UserMailer < ApplicationMailer
  default from: "hello@hrworks.co"

  helper :users

  def welcome_email(user)
    @user = user
    # @url = 
    # attachments.inline['hrworks_v2_logo.png'] = File.read('app/assets/images/hrworks_v2_logo.png')
    mail(to: @user.email, subject: 'Welcome to Hrworks')
  end

end
