class JobService
  def self.get_job_listings(city, title = nil)
    response = conn.get('/jobs') do |f|
      f.params['title'] = title
      f.params['location'] = city 
    end
    parse(response)[:data]
  end
  
  private

  def self.conn
    Faraday.new('https://job-microservice.herokuapp.com')
  end
  
  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end