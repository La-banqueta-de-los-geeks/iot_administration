FactoryBot.define do
  factory :token do
    expires_at { Faker::Date.in_date_period }
    token { SecureRandom.hex }
    user
  end
end
