class SavedJob < ApplicationRecord
    belongs_to :user
    validates :title, :company, :location, :url, :description, presence: true
end
