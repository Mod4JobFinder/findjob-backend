class ChangeSalariesMinMaxToString < ActiveRecord::Migration[5.2]
  def change
    change_column :salaries, :min_salary, :string
    change_column :salaries, :max_salary, :string
  end
end
