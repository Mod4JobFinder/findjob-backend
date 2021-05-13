FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zipcode { "MyString" }
    email { "MyString" }
    password { "" }
  end
end
