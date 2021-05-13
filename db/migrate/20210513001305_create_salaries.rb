class CreateSalaries < ActiveRecord::Migration[5.2]
  def change
    create_table :salaries do |t|
      t.string :city
      t.string :title
      t.float :min_salary
      t.float :max_salary

      t.timestamps
    end
  end
end
