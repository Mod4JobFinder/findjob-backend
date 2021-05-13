class User < ApplicationRecord
    has_secure_password
    validates_length_of :password, minimum: 8
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    has_many :saved_jobs, dependent: :destroy
    validates :first_name, :last_name, :city, :state, :zipcode, :password_confirmation, presence: true
end
