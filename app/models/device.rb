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
class Device < ApplicationRecord
  belongs_to :organization
  has_and_belongs_to_many :port_values
end
