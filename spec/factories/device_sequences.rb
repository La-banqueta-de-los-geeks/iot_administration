# == Schema Information
# Schema version: 20220123034402
#
# Table name: device_sequences
#
#  id              :bigint           not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  device_group_id :bigint
#
# Indexes
#
#  index_device_sequences_on_device_group_id  (device_group_id)
#
FactoryBot.define do
  factory :device_sequence do
    name { Faker::Games::Pokemon.name }
    device_group
  end
end
