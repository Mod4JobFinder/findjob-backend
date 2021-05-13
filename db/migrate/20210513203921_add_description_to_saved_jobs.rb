class AddDescriptionToSavedJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :saved_jobs, :description, :text
  end
end
