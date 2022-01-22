# == Schema Information
# Schema version: 20210530061319
#
# Table name: organizations
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :organization do
    name { "#{Faker::Games::Pokemon.name} #{rand(0..1000)}" }
  end
end
