require 'rails_helper'

describe 'Routes device' do
  it 'Device register' do
    expect(post: '/v1/devices').to route_to(
      format: 'json',
      controller: 'v1/devices',
      action: 'create'
    )
  end
  it 'Device Index' do
    expect(get: '/v1/devices').to route_to(
      format: 'json',
      controller: 'v1/devices',
      action: 'index'
    )
  end
  it 'Device update' do
    expect(put: '/v1/devices/1').to route_to(
      format: 'json',
      controller: 'v1/devices',
      action: 'update',
      id: '1'
    )
  end
end
