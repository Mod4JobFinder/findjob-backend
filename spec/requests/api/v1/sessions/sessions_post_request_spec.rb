require 'rails_helper'

RSpec.describe "Api::V1::Sessions Create", type: :request do
    before(:each) do
        user = create(:user,
                  email: "whatever@example.com",
                  password: "password",
                  first_name: "Khoa",
                  last_name: "Nguyen",
                  city: "The Moon",
                  state: "MN",
                  zipcode: '80000'
        )
        
        @valid_body = {
                        "email": "whatever@example.com",
                        "password": "password"
                        }

        @no_email = {
                        "password": "password"
                        }

        @empty_email = {
                        "email": "",
                        "password": "password"
                        }

        @no_password = {
                        "email": "whatever@example.com"
                        }

       @empty_password = {
                        "email": "whatever@example.com",
                        "password": ""
                        }

        @invalid_body = {
                        "email": "whatever@example.com",
                        "password": "password123"
                        }

         @invalid_email = {
                        "email": "whatever234@example.com",
                        "password": "password"
                        }

    end

    describe 'happy path' do 
        it 'should return a 201 if the parameters are valid' do 
            post api_v1_sessions_path, params: @valid_body
            request.headers['Content-Type'] = 'application/json'
            request.headers['Accept'] = 'application/json'
                            
            json = JSON.parse(response.body, symbolize_names: true)
            expect(response).to have_http_status(201)
            expect(json.keys).to eq([:data])
            expect(json[:data].keys).to eq(%i[id type attributes])
            expect(json[:data][:attributes].keys).to eq(%i[email first_name last_name city state zipcode saved_jobs])
        end
    end

     describe 'sad path' do 
        it 'should return a 400 if the parameters have no email' do 
            post api_v1_sessions_path, params: @no_email
             json = JSON.parse(response.body, symbolize_names: true)
            expect(response).to have_http_status(400)
            expect(json[:error]).to eq("invalid parameters")
        end

         it 'should return a 400 if the parameter email is empty' do 
            post api_v1_sessions_path, params: @empty_email
             json = JSON.parse(response.body, symbolize_names: true)
            expect(response).to have_http_status(400)
            expect(json[:error]).to eq("invalid parameters")
        end

         it 'should return a 400 if the parameter no password' do 
            post api_v1_sessions_path, params: @no_password
             json = JSON.parse(response.body, symbolize_names: true)
            expect(response).to have_http_status(400)
            expect(json[:error]).to eq("invalid parameters")
        end

         it 'should return a 400 if the parameter password is empty' do 
            post api_v1_sessions_path, params: @empty_password
             json = JSON.parse(response.body, symbolize_names: true)
            expect(response).to have_http_status(400)
            expect(json[:error]).to eq("invalid parameters")
        end

        it 'should return a 400 if the parameter password is wrong' do 
            post api_v1_sessions_path, params: @invalid_body
             json = JSON.parse(response.body, symbolize_names: true)
            expect(response).to have_http_status(400)
            expect(json[:error]).to eq("invalid parameters")
        end

         it 'should return a 400 if the parameter email is wrong' do 
            post api_v1_sessions_path, params: @invalid_email
             json = JSON.parse(response.body, symbolize_names: true)
            expect(response).to have_http_status(400)
            expect(json[:error]).to eq("invalid parameters")
        end
    end
end