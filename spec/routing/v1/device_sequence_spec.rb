require 'rails_helper'

describe 'Routes device sequence' do
  it 'Device Sequence register' do
    expect(post: '/v1/devices/device_sequences').to route_to(
      format: 'json',
      controller: 'v1/devices/device_sequences',
      action: 'create'
    )
  end
  it 'Device Sequence update' do
    expect(put: '/v1/devices/device_sequences/1').to route_to(
      format: 'json',
      controller: 'v1/devices/device_sequences',
      action: 'update',
      id: '1'
    )
  end
end
