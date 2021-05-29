# == Schema Information
#
# Table name: tokens
#
#  id         :bigint           not null, primary key
#  expires_at :datetime
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tokens_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :token do
    expires_at { Faker::Date.in_date_period }
    token { SecureRandom.hex }
    user
  end
end
