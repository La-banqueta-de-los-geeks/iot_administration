require 'rails_helper'

RSpec.describe V1::Devices::SequencesController, type: :routing do
  describe 'routing' do
    it 'Sequence index' do
      expect(get: '/v1/devices/device_groups/1/device_sequences/1/sequences').to route_to(
        format: 'json',
        controller: 'v1/devices/sequences',
        action: 'index',
        device_group_id: "1",
        device_sequence_id: "1"
      )
    end
    describe 'routing' do
      it 'Sequence register' do
        expect(post: '/v1/devices/device_groups/1/device_sequences/1/sequences').to route_to(
          format: 'json',
          controller: 'v1/devices/sequences',
          action: 'create',
          device_group_id: "1",
          device_sequence_id: "1"
        )
      end
    end
  end
end
