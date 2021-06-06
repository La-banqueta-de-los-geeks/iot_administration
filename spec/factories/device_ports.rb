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
FactoryBot.define do
  factory :device_port do
    status { %i[ON OFF][rand(0..1)] }
    port { 0 }
    device
  end
end
