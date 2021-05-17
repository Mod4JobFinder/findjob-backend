require 'rails_helper'

RSpec.describe JobFacade, type: :model do
  describe 'class methods' do 
    # context '#formatted_jobs' do 
    #   it 'should return an array of job hashes formatted nicely', :vcr do 
    #     jobs = JobFacade.formatted_jobs('denver', 'software+engineer')
        
    #     expect(jobs[0][:title]).to be_a(String)
    #     expect(jobs[0][:company]).to be_a(String)
    #     expect(jobs[0][:url]).to be_a(String)
    #     expect(jobs[0][:description]).to be_a(String)
    #     expect(jobs[0][:location]).to be_a(String)
    #     expect(jobs[0][:categories]).to be_a(String)
    #     expect(jobs[0][:date]).to be_a(String)
    #   end
    # end

    context '#create_job_listings' do 
      it 'should find or create job listings for the givne city/location', :vcr do 
        listings = JobFacade.create_job_listings('denver', 'software+engineer')

        expect(listings[0].id).to be_an(Integer)
        expect(listings[0].title).to be_a(String)
        expect(listings[0].company).to be_a(String)
        expect(listings[0].url).to be_a(String)
        expect(listings[0].description).to be_a(String)
        expect(listings[0].location).to be_a(String)
        expect(listings[0].categories).to be_a(String)
        expect(listings[0].date).to be_a(String)
        expect(JobListing.all.size).to_not eq(0)
      end
    end 
  end 
end