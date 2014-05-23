require 'bcrypt'

class User < ActiveRecord::Base

  has_many :authored_surveys, class_name: "Survey"

  has_many :surveytakers
  has_many :taken_surveys, through: :surveytakers, source: :survey

  has_many :responses

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
  	user = User.find_by_email(email)
  	if user && user.password == password
  		return true
  	end
  end

end

