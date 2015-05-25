class User < ActiveRecord::Base

  validates :name, presence: true, length: { minimum: 3 , message: "is too short (≥3 chars)" }#,message: 'custom message here'
  validates :email, presence: true, uniqueness: {message: "is already registerred", case_sensitive: false }, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  
end
