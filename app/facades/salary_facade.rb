require 'ostruct'

class SalaryFacade 
  def self.flood_db
    Salary.destroy_all
    cities = SalaryService.get_na_urban_areas.map do |city|
      city.split(',')[0].downcase.gsub(' ', '-').gsub('.', '')
    end.delete_if{ |e| e == 'portland' || e == 'washington' }
    cities.map do |city|
      thing = salary_objects(city)
    end
  end

  def self.salary_objects(city)
    array = SalaryService.get_salary_info(city)
    return [] if array.empty?
    array.map do |job|
      data = {
        city: city,
        title: job[:title],
        min_salary: job[:min],
        max_salary: job[:max]
      }
      Salary.create!(data)
    end 
  end 
end 
