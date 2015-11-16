class User < ActiveRecord::Base
	attr_accessor :password, :password_confirmation
	  before_save { self.email = email.downcase! }
	  validates :name, presence: true
	  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	  validates :email, presence: true, uniqueness: { case_sensitive: false}
	  has_secure_password
	  # validates :password, presence: true
end
