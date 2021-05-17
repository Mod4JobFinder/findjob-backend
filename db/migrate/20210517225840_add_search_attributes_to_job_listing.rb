class AddSearchAttributesToJobListing < ActiveRecord::Migration[5.2]
  def change
    add_column :job_listings, :search_city, :string
    add_column :job_listings, :search_title, :string
  end
end
