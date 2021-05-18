class JobFacade
  def self.create_job_listings(city, title = nil)
    listings = JobService.get_job_listings(city, title)
    listings.map do |listing|
      hash = { 
        title: listing[:attributes][:title],
        company: listing[:attributes][:company],
        url: listing[:attributes][:link],
        description: listing[:attributes][:description].gsub("**BREAK**", "\n"),
        location: listing[:attributes][:location],
        categories: listing[:attributes][:category].join(', '),
        date: Date.parse(listing[:attributes][:publish_date]).strftime('%a %B %e, %Y').gsub('  ', ' '),
        search_title: title,
        search_city: city
      }
      JobListing.find_or_create_by(hash)
    end
  end

  # def self.db_flood
  #   cities = SalaryService.get_na_urban_areas.map do |city|
  #     city.split(',')[0].downcase.gsub(' ', '-').gsub('.', '')
  #   end.delete_if{ |e| e == 'portland' || e == 'washington' }

  #   titles = ['Data Analyst', 'Data Scientist', 'Mobile Developer', 'QA Engineer', 'Sofware Engineer', 'Systems Administrator', 'Web Developer']

  #   cities.each do |city|
  #     titles.each do |title|
  #       create_job_listings(city, title)
  #     end
  #   end
  # end
end