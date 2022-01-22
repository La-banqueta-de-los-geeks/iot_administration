# == Schema Information
# Schema version: 20210530061319
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
require 'rails_helper'

RSpec.describe PortValue, type: :model do
  describe 'Validations in PortValue' do
    describe 'Attributes' do
      context 'Presence' do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:value) }
      end
    end

    describe 'Relationships' do
      context 'Belongs to' do
        it { should belong_to(:organization) }
      end
      context 'Associations' do
        it { should have_and_belong_to_many(:device_ports) }
        it { should have_many(:sequences) }
      end
    end
  end
end
