
#user model creates an instance of a user.
class User < ApplicationRecord
	
	before_save { self.email = email.downcase }
	#ensures the name isn't an empty string, isn't over 50 characters
	validates :name, presence: true, length:{maximum:50}
	#constant regex for email verification
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	#ensures the email isn't an empty string, and isn't over 255, is correctly formated,
	validates :email, presence: true, length: {maximum: 255}, 
									  format: {with: VALID_EMAIL_REGEX},
									  uniqueness: {case_sensitive: false}
	
	#adds a hashed password digest to the database through bcrypt.								  
	has_secure_password
	#validates password
	validates :password, presence: true, length: {minimum: 6}



end
