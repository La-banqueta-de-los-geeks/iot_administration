# == Schema Information
# Schema version: 20210530061319
#
# Table name: device_ports
#
#  id         :bigint           not null, primary key
#  port       :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  device_id  :bigint           not null
#
# Indexes
#
#  index_device_ports_on_device_id  (device_id)
#
# Foreign Keys
#
#  fk_rails_...  (device_id => devices.id)
#
class DevicePort < ApplicationRecord
  include TokenConcerns
  after_commit :send_status
  # Delegates
  delegate :token, to: :token, prefix: :device, allow_nil: true
  # Relationships
  belongs_to :device
  has_and_belongs_to_many :port_values
  has_many :sequences
  # validations
  validates :port, :status, presence: true
  def send_status
    Redis.current.publish "device_port_#{device_id}", to_json
  end
end
