class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    has_many :saved_jobs, dependent: :destroy
    validates :first_name, :last_name, :city, :state, :zipcode, presence: true
end
