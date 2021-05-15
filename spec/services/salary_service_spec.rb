require 'rails_helper'

RSpec.describe SalaryService, type: :model do
  describe 'class methods' do 
    # describe '#get_salary_link' do 
    #   it 'should return the link to a citys salary endpoint', :vcr do 
    #     response = SalaryService.get_salary_link('denver')

    #     expect(response).to eq('https://api.teleport.org/api/urban_areas/slug:denver/salaries/')
    #   end
      
    #   it 'should return [] if city is not an urban area', :vcr do
    #     response = SalaryService.get_salary_link('Littleton')

    #     expect(response).to eq([])
    #   end
    # end

    describe '#get_salary_info', :vcr do 
      it 'should return job salaries for a city', :vcr do 
        response = SalaryService.get_salary_info('denver')

        expect(response).to be_an(Array)
        expect(response.size).to eq(6)
        expect(response[0][:title]).to be_a(String)
        expect(response[0][:min]).to be_a(String)
        expect(response[0][:max]).to be_a(String)
      end
      
      # it 'should return [] if city is not an urban area', :vcr do 
      #   response = SalaryService.get_salary_link('Mesa')

      #   expect(response).to eq([])
      # end
    end
  end 
end