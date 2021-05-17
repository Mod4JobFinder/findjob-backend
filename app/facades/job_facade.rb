class JobFacade

    def self.formatted_jobs(city, title = nil)
        listings = JobService.get_job_listings(city, title)
        listings.map do |listing|
            
            { 
                category: listing[:attributes][:category].join(', '),
                company: listing[:attributes][:company],
                description: listing[:attributes][:description].gsub("**BREAK**", "\n"),
                url: listing[:attributes][:link],
                publish_date: Date.parse(listing[:attributes][:publish_date]).strftime('%a %B %e, %Y').gsub('  ', ' '),
                title: listing[:attributes][:title],
                salary:
             }
        end
    end
    

end