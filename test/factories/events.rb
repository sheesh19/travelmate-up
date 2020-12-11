FactoryBot.define do
  factory :event do
    location { nil }
    trip { nil }
    start_date { "2020-12-11 00:22:07" }
    end_date { "2020-12-11 00:22:07" }
    max_spots { 1 }
    description { "MyText" }
    title { "MyString" }
  end
end
