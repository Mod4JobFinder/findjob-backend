class JobListing < ApplicationRecord
    validates :title, :company, :url, :description, :location, presence: true
end
