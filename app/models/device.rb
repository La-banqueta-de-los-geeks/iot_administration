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
  include TokenConcerns
  # Callbacks
  after_create :generate_token
  after_commit :send_status
  # Delegates
  delegate :token, to: :token, prefix: :device, allow_nil: true
  # Relationships
  belongs_to :organization
  has_one :token, as: :entity
  has_many :device_ports
  has_many :device_sequences
  has_and_belongs_to_many :port_values
  # Validations
  validates :name, :status, :organization_id, presence: true
  validates_inclusion_of :status, in: %w[ON OFF]
  def send_status
    #Redis.current.publish "device_#{device_id}", to_json
  end
end
