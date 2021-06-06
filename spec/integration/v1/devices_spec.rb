# spec/integration/devices_spec.rb
require 'rails_helper'
require 'swagger_helper'

describe 'devices API' do
  path '/v1/devices/' do
    post 'Create device' do
      tags 'Devices'
      consumes 'application/json'
      parameter name: :device, in: :body, schema: { '$ref' => '#/components/schemas/device' }
      parameter({
                  in: :params,
                  type: :string,
                  name: :locale,
                  description: 'Locale'
                })
      security [Bearer: []]

      response '201', 'device created' do
        let(:owner) { create(:owner) }
        let(:Authorization) { "Bearer #{owner.user_token}" }
        let(:example) { build(:device, organization_id: owner.organization_id) }
        let(:device) { { device: example.as_json } }
        run_test!
      end
    end
  end

  path '/v1/devices/{id}' do
    put 'Update device' do
      tags 'Devices'
      consumes 'application/json'
      parameter name: :device, in: :body, schema: { '$ref' => '#/components/schemas/device' }
      parameter({
                  in: :params,
                  type: :string,
                  name: :locale,
                  description: 'Locale'
                })
      security [Bearer: []]
      parameter({ name: :id, in: :path, type: :integer })
      response '200', 'device updated' do
        let(:owner) { create(:owner) }
        let(:Authorization) { "Bearer #{owner.user_token}" }
        let(:example) { create(:device, organization_id: owner.organization_id) }
        let(:id) { example.id }
        let(:device) { { device: example.as_json } }
        run_test!
      end
    end

    path '/v1/devices/' do
      get 'Index devices' do
        tags 'Devices'
        consumes 'application/json'
        parameter({
                    in: :params,
                    type: :string,
                    name: :locale,
                    description: 'Locale'
                  })
        security [Bearer: []]
        response '200', 'device updated' do
          let(:owner) { create(:owner) }
          let(:Authorization) { "Bearer #{owner.user_token}" }
          run_test!
        end
      end
    end
  end
end
# rake rswag:specs:swaggerize
