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
require 'rails_helper'

RSpec.describe DevicePort, type: :model do
  describe 'Validations in DevicePort' do
    describe 'Attributes' do
      context 'Presence' do
        it { should validate_presence_of(:port) }
        it { should validate_presence_of(:status) }
      end
    end

    describe 'Relationships' do
      context 'Belongs to' do
        it { should belong_to(:device) }
      end
      context 'Associations' do
        it { should have_and_belong_to_many(:port_values) }
        it { should have_many(:sequences) }
      end
    end
  end
end
