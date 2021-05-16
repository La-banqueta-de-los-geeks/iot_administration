# == Schema Information
#
# Table name: organizations
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_organizations_on_user_id  (user_id)
#
FactoryBot.define do
  factory :organization do
    name { Faker::Games::Pokemon.name }
    user
  end
end
