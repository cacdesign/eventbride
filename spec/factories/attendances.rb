FactoryBot.define do
  factory :attendance do
    stripe_customer_id { "123" }
    event { FactoryBot.create(:event) }
    user { FactoryBot.create(:user) }
  end
end