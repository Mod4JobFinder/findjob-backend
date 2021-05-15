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

  # def self.get_salary_link(city)
  #   response = conn.get("/api/urban_areas/slug%3A#{city}/")
  #   return [] if response.status != 200
  #   parse(response)['_links']['ua:salaries']['href']
  # end

  def self.get_salary_info(city)
    response = Faraday.get("https://urban-salary-ms.herokuapp.com/api/#{city}")
    salaries = parse(response)['salaries']
    final_jobs = []
    jobs = ['Data Analyst', 'Data Scientist', 'Mobile Developer', 'QA Engineer', 'Sofware Engineer', 'Systems Administrator', 'Web Developer']
    jobs.each do |job|
      salaries.map do |salary|
        if job == salary['job']['title']
          final_jobs << {
            title: salary['job']['title'],
            min: sprintf("$%2.2f", salary['salary_percentiles']['percentile_25']),
            max: sprintf("$%2.2f", salary['salary_percentiles']['percentile_75'])
          }
        end 
      end 
    end 
    final_jobs
  end 
end 