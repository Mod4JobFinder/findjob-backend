FactoryBot.define do
  factory :user do
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    city { Faker::String.random(length: 5) }
    state { "CO" }
    zipcode { Faker::Number.number(digits: 5).to_s }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
