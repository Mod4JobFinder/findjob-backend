class ChangeCategoriestoCategoryInJobListing < ActiveRecord::Migration[5.2]
  def change
    rename_column :job_listings, :categories, :category
  end
end
