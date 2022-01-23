# spec/integration/users_spec.rb
require 'rails_helper'
require 'swagger_helper'

describe 'Users API' do
  path '/v1/users/' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: { '$ref' => '#/components/schemas/user' }

      response 201, 'user created' do
        let(:user) { { user: { email: 'foo@test.com', password: '12345678', organization_attributes: { name: 'test' } } } }
        run_test!
      end
      response 400, "Can't register user" do
        let(:user) { { user: { email: 'foo@test.com' } } }
        run_test!
      end
    end
  end
  path '/v1/users/login' do
    post 'create user session' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: { '$ref' => '#/components/schemas/user_login' }
      let(:owner) { create(:owner, password: '12345678') }
      response 200, 'Successful login' do
        let(:user) { { user: { email: owner.email, password: '12345678' } } }
        run_test!
      end
      response 400, "Can't login" do
        let(:user) { { user: { email: owner.email } } }
        run_test!
      end
    end
  end
end
