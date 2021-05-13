class CreateSavedJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_jobs do |t|
      t.string :title
      t.string :location
      t.string :company
      t.string :url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
