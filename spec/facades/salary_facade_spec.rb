require 'rails_helper'

RSpec.describe SalaryFacade, type: :model do
  describe 'class methods' do 
    describe '#salary_objects' do 
      it 'should return salary objects with correct attributes', :vcr do 
        SalaryFacade.flood_db
        salaries = SalaryFacade.salary_objects('denver')

        expect(salaries.size).to eq(6)
        expect(salaries[0]).to be_a(Salary)
        expect(salaries[0][:city]).to eq('denver')
        expect(salaries[0][:title]).to be_a(String)
        expect(salaries[0][:min_salary]).to be_a(String)
        expect(salaries[0][:max_salary]).to be_a(String)
      end
    end
  end
end