require 'rails_helper'

RSpec.describe "Api::V1::Users Create", type: :request do
  describe 'happy path' do 
    it 'should return a 201 if the parameters are valid' do 
      valid_body = {
                      "email": "whatever@example.com",
                      "password": "password",
                      "password_confirmation": "password",
                      "first_name": "Khoa",
                      "last_name": "Nguyen",
                      "city": "The Moon",
                      "state": "MN",
                      "zipcode": '80000'
                    }

      post api_v1_users_path, params: valid_body
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(201)
      expect(json[:data]).to eq('success')
    end
  end 

  describe 'sad path' do 
    it 'should return 400 if email is already taken' do 
      user = create(:user)
      invalid_body = {
                      "email": user.email,
                      "password": "password",
                      "password_confirmation": "password",
                      "first_name": "Khoa",
                      "last_name": "Nguyen",
                      "city": "The Moon",
                      "state": "MN",
                      "zipcode": '80000'
                    }

      post api_v1_users_path, params: invalid_body
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(400)
      expect(json[:error]).to eq(['Email has already been taken'])
    end 

    it 'should return 400 if missing email' do 
      invalid_body = {
                      "password": "password",
                      "password_confirmation": "password",
                      "first_name": "Khoa",
                      "last_name": "Nguyen",
                      "city": "The Moon",
                      "state": "MN",
                      "zipcode": '80000'
                    }

      post api_v1_users_path, params: invalid_body
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(400)
      expect(json[:error]).to eq(['email parameter was not included in your request'])
    end 

    it 'should return 400 if email is not an email' do 
      invalid_body = {
                      "email": "email",
                      "password": "password",
                      "password_confirmation": "password",
                      "first_name": "Khoa",
                      "last_name": "Nguyen",
                      "city": "The Moon",
                      "state": "MN",
                      "zipcode": '80000'
                    }

      post api_v1_users_path, params: invalid_body
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)
      expect(json[:error]).to eq(["Email is invalid"])
    end 

    it 'should return 400 if missing password/password confirmation' do 
       invalid_body = {
                      "email": "whatever@example.com",
                      "password_confirmation": "password",
                      "first_name": "Khoa",
                      "last_name": "Nguyen",
                      "city": "The Moon",
                      "state": "MN",
                      "zipcode": '80000'
                    }

      post api_v1_users_path, params: invalid_body
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(400)
      expect(json[:error]).to eq(["Password can't be blank", "Password is too short (minimum is 8 characters)"])

      invalid_body_2 = {
                      "email": "whatever2@example.com",
                      "password": "password",
                      "first_name": "Khoa",
                      "last_name": "Nguyen",
                      "city": "The Moon",
                      "state": "MN",
                      "zipcode": '80000'
                    }

      post api_v1_users_path, params: invalid_body_2
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(400)
      expect(json[:error]).to eq(["Password confirmation can't be blank"])
    end 

    it 'should return 400 if password and confirmation dont match' do 
      invalid_body = {
                      "email": "whatever2@example.com",
                      "password": "password",
                      "password_confirmation": "password123",
                      "first_name": "Khoa",
                      "last_name": "Nguyen",
                      "city": "The Moon",
                      "state": "MN",
                      "zipcode": '80000'
                    }

      post api_v1_users_path, params: invalid_body
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)
      expect(json[:error]).to eq(["Password confirmation doesn't match Password"])
    end

    it 'should return 400 if first or last name is missing' do 
      invalid_body = {
                      "email": "whatever2@example.com",
                      "password": "password",
                      "password_confirmation": "password",
                      "last_name": "Nguyen",
                      "city": "The Moon",
                      "state": "MN",
                      "zipcode": '80000'
                    }

      post api_v1_users_path, params: invalid_body
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)
      expect(json[:error]).to eq(["First name can't be blank"])

      invalid_body_2 = {
                      "email": "whatever2@example.com",
                      "password": "password",
                      "password_confirmation": "password",
                      "first_name": "Nguyen",
                      "city": "The Moon",
                      "state": "MN",
                      "zipcode": '80000'
                    }

      post api_v1_users_path, params: invalid_body_2
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)
      expect(json[:error]).to eq(["Last name can't be blank"])
    end 

    it 'should return 400 if city state or zip is missing' do 
      invalid_body = {
                      "email": "whatever2@example.com",
                      "password": "password",
                      "password_confirmation": "password",
                      "first_name": "Khoa",
                      "last_name": "Nguyen",
                      "state": "MN",
                      "zipcode": '80000'
                    }

      post api_v1_users_path, params: invalid_body
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)
      expect(json[:error]).to eq(["City can't be blank"])

      invalid_body_2 = {
                      "email": "whatever2@example.com",
                      "password": "password",
                      "password_confirmation": "password",
                      "first_name": "Khoa",
                      "last_name": "Nguyen",
                      "city": "Denver",
                      "zipcode": '80000'
                    }

      post api_v1_users_path, params: invalid_body_2
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)
      expect(json[:error]).to eq(["State can't be blank"])

      invalid_body_3 = {
                      "email": "whatever2@example.com",
                      "password": "password",
                      "password_confirmation": "password",
                      "first_name": "Khoa",
                      "last_name": "Nguyen",
                      "city": "Denver",
                      "state": 'CO'
                    }

      post api_v1_users_path, params: invalid_body_3
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)
      expect(json[:error]).to eq(["Zipcode can't be blank"])
    end

    it 'should return 400 if password is too short' do 
      invalid_body = {
                      "email": "whatever2@example.com",
                      "password": "p",
                      "password_confirmation": "p",
                      "first_name": "Khoa",
                      "last_name": "Nguyen",
                      "city": "Denver",
                      "state": "MN",
                      "zipcode": '80000'
                    }

      post api_v1_users_path, params: invalid_body
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)
      expect(json[:error]).to eq(["Password is too short (minimum is 8 characters)"])
    end
  end
end