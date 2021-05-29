# == Schema Information
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
  belongs_to :device

  after_commit :send_status

  def send_status
    Redis.current.publish "device_#{device_id}", to_json
  end
end
