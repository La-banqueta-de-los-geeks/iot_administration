# == Schema Information
# Schema version: 20210530061319
#
# Table name: port_values
#
#  id              :bigint           not null, primary key
#  name            :string
#  value           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#
# Indexes
#
#  index_port_values_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#
FactoryBot.define do
  factory :port_value do
    name { Faker::Games::Pokemon.name }
    value { %i[OFF ON][rand(0..1)] }
    organization
  end
end
