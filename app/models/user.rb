require 'securerandom'

class User < ApplicationRecord

  attr_accessor :password

  validates :handle, presence: true, uniqueness: true, on: :create
  validates :password, presence: true, confirmation: true, length: {in: 8..32}, on: :create

  before_save :encrypt_password

  def self.login(params)
    user = User.find_by(handle: params[:handle])

    if user.present?
      password = BCrypt::Engine.hash_secret(params[:password], user.salt)

      if user.crypted_password == password
        return user
      else
        # Handle login error
      end
    else
      # Handle login error
    end
  end

  protected

  def encrypt_password
    if self.password.present? && self.password_confirmation.present?
      self.salt             = BCrypt::Engine.generate_salt
      self.crypted_password = BCrypt::Engine.hash_secret(self.password, salt)
    end
  end

end
