# == Schema Information
# Schema version: 20220123015711
#
# Table name: device_groups
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  device_id  :bigint           not null
#
# Indexes
#
#  index_device_groups_on_device_id  (device_id)
#
# Foreign Keys
#
#  fk_rails_...  (device_id => devices.id)
#
FactoryBot.define do
  factory :device_group do
    name { Faker::Games::Pokemon.name }
    device
  end
end
