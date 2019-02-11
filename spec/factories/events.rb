FactoryBot.define do
  factory :event do
    start_date { "2019-03-11 09:26:55" }
    duration {50}
    title { "My fuck** conference" }
    description { "This is my fucki** conf about my fucking skillsskillsskillsskillsskillsskillsskills" }
    price { 100 }
    location { "Ibiza" }
    admin {FactoryBot.create(:user)}
  end
end