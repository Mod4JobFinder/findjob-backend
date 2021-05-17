require 'rails_helper'

RSpec.describe JobService, type: :model do
  describe "class methods" do
    context "#get job listings" do
      it "should return job listings plus info for city", :vcr do
        response = JobService.get_job_listings('denver')
        
        expect(response[0][:attributes].keys).to eq(%i[category company description link location publish_date title])
        expect(response[0][:attributes][:category]).to be_an(Array)
        expect(response[0][:attributes][:company]).to be_a(String)
        expect(response[0][:attributes][:description]).to be_a(String)
        expect(response[0][:attributes][:link]).to be_a(String)
        expect(response[0][:attributes][:location]).to be_a(String)
        expect(response[0][:attributes][:publish_date]).to be_a(String)
        expect(response[0][:attributes][:title]).to be_a(String)
        expect(response[0][:attributes][:title]).to be_a(String)
      end

      it "should return job listings plus info for city and title", :vcr do
        response = JobService.get_job_listings('denver', 'software+engineer')

        expect(response[0][:attributes].keys).to eq(%i[category company description link location publish_date title])
        expect(response[0][:attributes][:category]).to be_an(Array)
        expect(response[0][:attributes][:company]).to be_a(String)
        expect(response[0][:attributes][:description]).to be_a(String)
        expect(response[0][:attributes][:link]).to be_a(String)
        expect(response[0][:attributes][:location]).to be_a(String)
        expect(response[0][:attributes][:publish_date]).to be_a(String)
        expect(response[0][:attributes][:title]).to be_a(String)
        expect(response[0][:attributes][:title]).to be_a(String)
      end
    end
  end
end