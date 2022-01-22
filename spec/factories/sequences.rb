# == Schema Information
# Schema version: 20210530061319
#
# Table name: sequences
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  device_port_id     :bigint           not null
#  device_sequence_id :bigint           not null
#  port_value_id      :bigint           not null
#
# Indexes
#
#  index_sequences_on_device_port_id      (device_port_id)
#  index_sequences_on_device_sequence_id  (device_sequence_id)
#  index_sequences_on_port_value_id       (port_value_id)
#
# Foreign Keys
#
#  fk_rails_...  (device_port_id => device_ports.id)
#  fk_rails_...  (device_sequence_id => device_sequences.id)
#  fk_rails_...  (port_value_id => port_values.id)
#
FactoryBot.define do
  factory :sequence do
    device_sequence { nil }
    device_port { nil }
    port_value { nil }
  end
end
