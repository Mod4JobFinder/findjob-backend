require 'rails_helper'

RSpec.describe JobService, type: :model do
    describe "class methods" do
      context "#get job listings" do
        it "should return job listings plus info for city", :vcr do
            response = JobService.get_job_listings('denver')
        end

         it "should return job listings plus info for city and title", :vcr do
            response = JobService.get_job_listings('denver', 'software+engineer')
        end
      end
    end
    
end