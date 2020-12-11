FactoryBot.define do
  factory :trip do
    title { "MyString" }
    user { nil }
    start_date { "2020-12-11 00:20:10" }
    end_date { "2020-12-11 00:20:10" }
    description { "MyText" }
    trip_type { 1 }
    visibility { 1 }
    status { 1 }
  end
end
