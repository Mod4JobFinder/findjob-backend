class User < ApplicationRecord
  has_secure_password
  validates_length_of :password, minimum: 8, :if => :password
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, :last_name, :city, :state, :zipcode, presence: true
  validates :password_confirmation, presence: true, :if => :password
  has_many :saved_jobs, dependent: :destroy
end 
