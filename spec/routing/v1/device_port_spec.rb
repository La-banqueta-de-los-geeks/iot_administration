require 'rails_helper'

describe 'Routes device port' do
  it 'Device port register' do
    expect(post: '/v1/devices/device_ports').to route_to(
      format: 'json',
      controller: 'v1/devices/device_ports',
      action: 'create'
    )
  end
  it 'Device port index' do
    expect(get: '/v1/devices/device_ports').to route_to(
      format: 'json',
      controller: 'v1/devices/device_ports',
      action: 'index'
    )
  end
  it 'Device port update' do
    expect(put: '/v1/devices/device_ports/1').to route_to(
      format: 'json',
      controller: 'v1/devices/device_ports',
      action: 'update',
      id: '1'
    )
  end
end
