class AddCategoriesColumnToJobListingsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :job_listings, :categories, :string
  end
end
