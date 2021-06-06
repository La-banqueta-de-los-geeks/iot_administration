require 'rails_helper'

describe 'Routes device port' do
  it 'Device register' do
    expect(post: '/v1/devices/device_ports').to route_to(
      format: 'json',
      controller: 'v1/devices/device_ports',
      action: 'create'
    )
  end
  it 'Device index' do
    expect(get: '/v1/devices/device_ports').to route_to(
      format: 'json',
      controller: 'v1/devices/device_ports',
      action: 'index'
    )
  end
end
