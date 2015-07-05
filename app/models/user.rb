class User < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {message: "is already registered", case_sensitive: false }, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  # after_create :send_welcome_email
  after_create :subscribe_user_to_mailing_list
  

  # def send_welcome_email  #Only used when using own internal mailer.
  #   UserMailer.welcome_email(self).deliver_now
  # end

  private

  def subscribe_user_to_mailing_list
    SubscribeUserToMailingListJob.perform_later(self)
  end

end
