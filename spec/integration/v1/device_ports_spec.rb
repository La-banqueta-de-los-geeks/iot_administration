# spec/integration/devices_spec.rb
require 'rails_helper'
require 'swagger_helper'

describe 'devices API' do
  path '/v1/devices/device_ports' do
    post 'Create device port' do
      tags 'device_ports'
      consumes 'application/json'
      parameter name: :device_ports, in: :body, schema: { '$ref' => '#/components/schemas/device_port' }
      parameter({
                  in: :params,
                  type: :string,
                  name: :locale,
                  description: 'Locale'
                })
      security [Bearer: []]

      response '201', 'device port created' do
        let(:device) { create(:device) }
        let(:Authorization) { "Bearer #{device.device_token}" }
        let(:examples) { build_list(:device_port, 10) }
        let(:device_ports) { { device_ports: examples.map(&:as_json) } }
        run_test!
      end
    end
  end
  path '/v1/devices/device_ports' do
    get 'Index device ports' do
      tags 'device_ports'
      consumes 'application/json'
      parameter({
                  in: :params,
                  type: :string,
                  name: :locale,
                  description: 'Locale'
                })
      security [Bearer: []]
      response '200', 'device port index' do
        let(:device) { create(:device) }
        let(:Authorization) { "Bearer #{device.device_token}" }
        run_test!
      end
    end
  end
  path '/v1/devices/device_ports/{id}' do
    put 'Update device ports' do
      tags 'device_ports'
      consumes 'application/json'
      parameter name: :device_port, in: :body, schema: { '$ref' => '#/components/schemas/device_port' }
      parameter({
                  in: :params,
                  type: :string,
                  name: :locale,
                  description: 'Locale'
                })
      security [Bearer: []]
      parameter({ name: :id, in: :path, type: :integer })
      response '200', 'device ports updated' do
        let(:device) { create(:device) }
        let(:Authorization) { "Bearer #{device.device_token}" }
        let(:example) { create(:device_port, device_id: device.id) }
        let(:id) { example.id }
        let(:device_port) { { device_port: example.as_json } }
        run_test!
      end
    end
  end
end
# rake rswag:specs:swaggerize
