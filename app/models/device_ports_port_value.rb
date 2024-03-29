# == Schema Information
# Schema version: 20210530061319
#
# Table name: device_ports_port_values
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  device_port_id :bigint           not null
#  port_value_id  :bigint           not null
#
# Indexes
#
#  index_device_ports_port_values_on_device_port_id  (device_port_id)
#  index_device_ports_port_values_on_port_value_id   (port_value_id)
#
# Foreign Keys
#
#  fk_rails_...  (device_port_id => device_ports.id)
#  fk_rails_...  (port_value_id => port_values.id)
#
class DevicePortsPortValue < ApplicationRecord
  belongs_to :device_port
  belongs_to :port_value
end
