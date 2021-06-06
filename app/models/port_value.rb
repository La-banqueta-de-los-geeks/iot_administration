# == Schema Information
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
class PortValue < ApplicationRecord
  # Relationships
  belongs_to :organization
  has_many :sequences
  has_and_belongs_to_many :device_ports
  # Validations
  validates :name, :value, presence: true
end
