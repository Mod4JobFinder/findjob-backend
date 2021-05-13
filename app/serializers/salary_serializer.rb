class SalarySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :city, :title, :min_salary, :max_salary
end
