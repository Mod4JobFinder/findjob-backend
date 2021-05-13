require 'rails_helper'

RSpec.describe "Api::V1::Salaries Index", type: :request do
  describe 'happy path' do 
    it 'should return salaries for a given city with valid params', :vcr do 
      get api_v1_salaries_path, params: {city: 'denver'}

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)

      expect(json[:data]).to be_an(Array)
      expect(json[:data][0][:type]).to eq('salary')
      expect(json[:data][0][:attributes].keys).to eq([:id, :city, :title, :min_salary, :max_salary])
      expect(json[:data][0][:attributes][:id]).to be_an(Integer)
      expect(json[:data][0][:attributes][:city]).to be_an(String)
      expect(json[:data][0][:attributes][:title]).to be_an(String)
      expect(json[:data][0][:attributes][:min_salary]).to be_an(String)
      expect(json[:data][0][:attributes][:max_salary]).to be_an(String)
    end 
  end
  
  describe 'sad path' do 
    it 'should return invalid params if the city does not exist', :vcr do 
      get api_v1_salaries_path

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)
      expect(json[:error]).to eq('invalid parameters')
    end
  end 
end
