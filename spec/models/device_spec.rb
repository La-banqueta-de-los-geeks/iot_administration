# frozen_string_literal: true

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
require 'rails_helper'

RSpec.describe Device, type: :model do
  describe 'Device validations' do
    it 'validate name presence' do
      should validate_presence_of(:name)
    end
    it 'validate status presence' do
      should validate_presence_of(:status)
    end
    it 'validate organization_id presence' do
      should validate_presence_of(:organization_id)
    end
    it 'Validate only can assing status in ON or OFF' do
      should validate_inclusion_of(:status).in_array(%w[ON OFF])
    end
  end
  describe 'Relationships validations' do
    context 'belongs to' do
      it { should belong_to(:organization) }
    end
  end
end
