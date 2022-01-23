require 'rails_helper'

RSpec.describe V1::Devices::DeviceGroupsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/v1/devices/device_groups').to route_to(
        format: 'json',
        action: 'index',
        controller: 'v1/devices/device_groups'
      )
    end

    it 'routes to #create' do
      expect(post: '/v1/devices/device_groups').to route_to(
        format: 'json',
        action: 'create',
        controller: 'v1/devices/device_groups'
      )
    end

    it 'routes to #update via PUT' do
      expect(put: '/v1/devices/device_groups/1').to route_to(
        format: 'json',
        action: 'update',
        controller: 'v1/devices/device_groups', id: '1'
      )
    end
  end
end
