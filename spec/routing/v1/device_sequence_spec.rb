require 'rails_helper'

describe 'Routes device sequence' do
  it 'Device Sequence Index' do
    expect(get: '/v1/devices/device_groups/1/device_sequences').to route_to(
      format: 'json',
      controller: 'v1/devices/device_sequences',
      action: 'index',
      device_group_id: "1"
    )
  end
  it 'Device Sequence register' do
    expect(post: '/v1/devices/device_groups/1/device_sequences').to route_to(
      format: 'json',
      controller: 'v1/devices/device_sequences',
      action: 'create',
      device_group_id: "1"
    )
  end
  it 'Device Sequence update' do
    expect(put: '/v1/devices/device_groups/1/device_sequences/1').to route_to(
      format: 'json',
      controller: 'v1/devices/device_sequences',
      action: 'update',
      device_group_id: "1",
      id: '1'
    )
  end
end
