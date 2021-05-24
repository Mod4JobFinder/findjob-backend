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

    describe '#money' do 
      it 'should return an integer as a string formatted as money' do
        expect(SalaryService.money(8000.5013546)).to eq('$8,000.50')
        expect(SalaryService.money(20251.36456)).to eq('$20,251.36')
        expect(SalaryService.money(115235.50465)).to eq('$115,235.50')
        expect(SalaryService.money(1023456.78465546)).to eq('$1,023,456.78')
      end 
    end 
  end 
end