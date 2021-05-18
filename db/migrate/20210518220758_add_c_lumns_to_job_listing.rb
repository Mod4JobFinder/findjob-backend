class AddCLumnsToJobListing < ActiveRecord::Migration[5.2]
  def change
    add_column :job_listings, :category, :string
  end
end
