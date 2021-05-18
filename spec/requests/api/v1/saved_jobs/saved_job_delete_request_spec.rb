require 'rails_helper'

RSpec.describe 'Api::V1::SavedJob Destroy', type: :request do
  before :each do
    @user = create(:user,
                  email: "whatever@example.com",
                  password: "password1",
                  password_confirmation: "password1",
                  first_name: "Khoa",
                  last_name: "Nguyen",
                  city: "The Moon",
                  state: "MN",
                  zipcode: '80000'
                )
    @saved_job = @user.saved_jobs.create(
                  title: 'Title', 
                  location: 'Location, CO', 
                  url: 'www.url.com', 
                  description: 'Description', 
                  company: 'Company'
                ) 
  end

  describe 'happy path' do 
    it 'should return 204 if the saved job is valid' do 
      delete api_v1_saved_jobs_path, params: {id: @saved_job.id }

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)

      expect(json[:data]).to eq('saved job destroyed')
    end 
  end 

  describe 'sad path' do 
    it 'should return 400 if no id param' do 
      delete api_v1_saved_jobs_path
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)

      expect(json[:error]).to eq('invalid parameters')
    end 

    it 'should return 400 if id param is invalid' do 
      delete api_v1_saved_jobs_path, params: {id: 0000 }

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)

      expect(json[:error]).to eq('invalid parameters')
    end 
  end 
end