FactoryBot.define do
  factory :job_listing do
    title { "MyString" }
    company { "MyString" }
    url { "MyString" }
    description { "MyText" }
    salary { 1.5 }
    location { "MyString" }
  end
end
