class CreateJobListings < ActiveRecord::Migration[5.2]
  def change
    create_table :job_listings do |t|
      t.string :title
      t.string :company
      t.string :url
      t.text :description
      t.float :salary
      t.string :location

      t.timestamps
    end
  end
end
