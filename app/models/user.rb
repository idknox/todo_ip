class User < ActiveRecord::Base
  has_many :tasks

  has_secure_password
  validates :name, :email, :password, :password_confirmation,  presence: true
  validates :password, confirmation: true
  validates :email, uniqueness: true
end
