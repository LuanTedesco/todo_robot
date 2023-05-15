FactoryBot.define do
  factory :task do
    title { "MyString" }
    description { "MyString" }
    start_date { "2023-04-08" }
    end_date { "2023-04-08" }
    result { "MyString" }
    finished { false }
  end
end
