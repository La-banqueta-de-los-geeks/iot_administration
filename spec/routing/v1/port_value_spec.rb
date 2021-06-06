require 'rails_helper'

describe 'Routes port values' do
  it 'Port values register' do
    expect(post: '/v1/organizations/port_values').to route_to(
      format: 'json',
      controller: 'v1/organizations/port_values',
      action: 'create'
    )
  end
  it 'Port values index' do
    expect(get: '/v1/organizations/port_values').to route_to(
      format: 'json',
      controller: 'v1/organizations/port_values',
      action: 'index'
    )
  end
end
