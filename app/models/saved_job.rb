class SavedJob < ApplicationRecord
    belongs_to :user
    validates :title, :company, :location, :url, presence: true
end
