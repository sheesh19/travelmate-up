FactoryBot.define do
  factory :location do
    city { "MyString" }
    country { "MyString" }
    state { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
