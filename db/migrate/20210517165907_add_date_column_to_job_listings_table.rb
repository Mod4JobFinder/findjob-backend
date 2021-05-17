class AddDateColumnToJobListingsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :job_listings, :date, :string
  end
end
