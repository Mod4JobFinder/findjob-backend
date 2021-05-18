require 'rails_helper'

RSpec.describe 'Api::V1::SavedJobs Create', type: :request do
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
  end 

  describe 'happy path' do
    it 'should return a 201 if the job has been saved', :vcr do 
      valid_body = {
                      "email": @user.email,
                      "title": "Title",
                      "company": "Company",
                      "location": "location, CO",
                      "url": "www.url.com",
                      "description": "Description"
                    }

      post api_v1_saved_jobs_path, params: valid_body
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(201)

      expect(json[:data][:type]).to eq('saved_job')
      expect(json[:data][:attributes][:id]).to be_an(Integer)
      expect(json[:data][:attributes][:title]).to be_a(String)
      expect(json[:data][:attributes][:location]).to be_a(String)
      expect(json[:data][:attributes][:company]).to be_a(String)
      expect(json[:data][:attributes][:url]).to be_a(String)
      expect(json[:data][:attributes][:description]).to be_a(String)
    end
  end 

  describe 'sad path' do
    it 'should return 400 if email does not match a user', :vcr do 
      valid_body = {
                      "email": "email@email.com",
                      "title": "Title",
                      "company": "Company",
                      "location": "location, CO",
                      "url": "www.url.com",
                      "description": "Description"
                    }

      post api_v1_saved_jobs_path, params: valid_body
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)

      expect(json[:error]).to eq('invalid parameters')
    end 

    it 'should return 400 if there is no email param', :vcr do 
      valid_body = {
                      "title": "Title",
                      "company": "Company",
                      "location": "location, CO",
                      "url": "www.url.com",
                      "description": "Description"
                    }

      post api_v1_saved_jobs_path, params: valid_body
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)

      expect(json[:error]).to eq('invalid parameters')
    end 

    it 'should return 400 if there is no title', :vcr do 
      valid_body = {
                      "email": @user.email,
                      "company": "Company",
                      "location": "location, CO",
                      "url": "www.url.com",
                      "description": "Description"
                    }

      post api_v1_saved_jobs_path, params: valid_body
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)

      expect(json[:error]).to eq('invalid parameters')
    end

    it 'should return 400 if there is no location', :vcr do 
      valid_body = {
                      "email": @user.email,
                      "title": "Title",
                      "company": "Company",
                      "url": "www.url.com",
                      "description": "Description"
                    }

      post api_v1_saved_jobs_path, params: valid_body
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)

      expect(json[:error]).to eq('invalid parameters')
    end

    it 'should return 400 if there is no company', :vcr do 
      valid_body = {
                      "email": @user.email,
                      "title": "Title",
                      "location": "location, CO",
                      "url": "www.url.com",
                      "description": "Description"
                    }

      post api_v1_saved_jobs_path, params: valid_body
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)

      expect(json[:error]).to eq('invalid parameters')
    end

    it 'should return 400 if there is no url', :vcr do 
      valid_body = {
                      "email": @user.email,
                      "title": "Title",
                      "company": "Company",
                      "location": "location, CO",
                      "description": "Description"
                    }

      post api_v1_saved_jobs_path, params: valid_body
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)

      expect(json[:error]).to eq('invalid parameters')
    end

    it 'should return 400 if there is no description', :vcr do 
      valid_body = {
                      "email": @user.email,
                      "title": "Title",
                      "company": "Company",
                      "location": "location, CO",
                      "url": "www.url.com",
                    }

      post api_v1_saved_jobs_path, params: valid_body
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)

      expect(json[:error]).to eq('invalid parameters')
    end
  end 
end