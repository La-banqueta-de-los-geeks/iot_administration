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
  factory :organization do
    name { Faker::Games::Pokemon.name }
    user
  end
end
