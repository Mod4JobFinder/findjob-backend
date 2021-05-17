require 'rails_helper'

RSpec.describe "Api::V1::JobListings Index", type: :request do
  describe 'happy path' do 
    it 'should return 200 with serialized jobs when params are valid', :vcr do 
      get api_v1_jobs_path, params: {city: 'denver', title: 'software developer'}

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)

      expect(json[:data][0][:type]).to eq('job_listing')
      expect(json[:data][0][:attributes].keys).to eq(%i[id title company url description location categories date])
      expect(json[:data][0][:attributes][:id]).to be_an(Integer)
      expect(json[:data][0][:attributes][:title]).to be_a(String)
      expect(json[:data][0][:attributes][:company]).to be_a(String)
      expect(json[:data][0][:attributes][:url]).to be_a(String)
      expect(json[:data][0][:attributes][:description]).to be_a(String)
      expect(json[:data][0][:attributes][:location]).to be_a(String)
      expect(json[:data][0][:attributes][:categories]).to be_a(String)
      expect(json[:data][0][:attributes][:date]).to be_a(String)
    end 
  end 
end
