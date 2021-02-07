# == Schema Information
#
# Table name: devices_port_values
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  device_id     :bigint           not null
#  port_value_id :bigint           not null
#
# Indexes
#
#  index_devices_port_values_on_device_id      (device_id)
#  index_devices_port_values_on_port_value_id  (port_value_id)
#
# Foreign Keys
#
#  fk_rails_...  (device_id => devices.id)
#  fk_rails_...  (port_value_id => port_values.id)
#
class DevicesPortValue < ApplicationRecord
  belongs_to :device
  belongs_to :port_value
end
