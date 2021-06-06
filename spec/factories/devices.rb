# == Schema Information
#
# Table name: devices
#
#  id              :bigint           not null, primary key
#  name            :string
#  status          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#
# Indexes
#
#  index_devices_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#
FactoryBot.define do
  factory :device do
    name { Faker::Games::Pokemon.name }
    status { %i[ON OFF][rand(0..1)] }
    organization
  end
end
