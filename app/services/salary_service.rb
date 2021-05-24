class SalaryService
  def self.conn
    Faraday.new(url: 'https://api.teleport.org')
  end 

  def self.parse(response)
    JSON.parse(response.body)
  end

  def self.get_na_urban_areas
    response = conn.get('/api/continents/geonames%3ANA/urban_areas/')
    areas = parse(response)['_links']['ua:items'].map{|item| item['name']}
  end

  def self.get_salary_info(city)
    response = Faraday.get("https://urban-salary-ms.herokuapp.com/api/#{city}")
    salaries = parse(response)#['salaries']
    salaries.map do |salary|
      {
        title: salary['title'],
        min: money(salary['max']),
        max: money(salary['min'])
      }
    end
  end

  def self.money(amount)
    split = amount.to_s(:delimited).split('.')
    return "$#{split[0]}.#{split[1][0..1]}"
  end 
end