FactoryBot.define do
  factory :event_review do
    event { nil }
    comments { "MyText" }
    rating { 1 }
  end
end
