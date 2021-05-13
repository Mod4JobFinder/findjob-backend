class Salary < ApplicationRecord
    validates :city, :min_salary, :max_salary, :title, presence: true
end
