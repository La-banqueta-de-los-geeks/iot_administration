require 'rails_helper'

describe 'Routes user' do
  it 'User register' do
    expect(post: '/v1/users').to route_to(
      format: 'json',
      controller: 'v1/users',
      action: 'create'
    )
  end
  it 'User login' do
    expect(post: '/v1/users/login').to route_to(
      format: 'json',
      controller: 'v1/users',
      action: 'login'
    )
  end
end
