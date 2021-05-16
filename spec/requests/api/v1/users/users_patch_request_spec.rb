require 'rails_helper'

RSpec.describe "Api::V1::Users Update", type: :request do
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
    it 'should return a 200 if the users email is present and the attributes are valid' do 
      valid_body = {
                      "email": "whatever@example.com",
                      "first_name": "Andrew",
                      "last_name": "Johnston",
                      "city": "Denver",
                      "state": "CO",
                      "zipcode": "80020"
                    }

      patch api_v1_users_path, params: valid_body
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json[:data]).to eq('user successfully updated')
      user = User.find_by(email:@user.email)
      expect(user.first_name).to eq('Andrew')
      expect(user.last_name).to eq('Johnston')
      expect(user.city).to eq('Denver')
      expect(user.state).to eq('CO')
      expect(user.zipcode).to eq('80020')
    end
  end 

  describe 'sad path' do 
    it 'should return 400 if user cant be found' do 
      valid_body = {
                      "email": "whatever123@example.com",
                      "first_name": "Andrew",
                      "last_name": "Johnston",
                      "city": "Denver",
                      "state": "CO",
                      "zipcode": "80020"
                    }
      
      patch api_v1_users_path, params: valid_body
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(400)
      expect(json[:error]).to eq('invalid parameters')
    end 
  end 
end 