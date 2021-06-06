require 'rails_helper'

RSpec.describe V1::Devices::DevicePortsController, type: :controller do
  describe 'Create device port' do
    let(:device) { create(:device) }
    let(:headers) { { Authorization: "Bearer #{device.device_token}" } }
    let(:device_port) { build(:device_port, device: device) }
    before do
      request.headers.merge! headers
      post(:create, format: :json, params: { device_ports: [ device_port.as_json(:only => [ :port ]), device_port.as_json, device_port.as_json ,device_port.as_json ,device_port.as_json ]  } )
    end
    context 'Create device port successfully' do
      context 'Status CREATED' do
        subject { response }
        it { is_expected.to have_http_status(:created) }
      end
      context 'Payload correct data' do
        subject { payload_crud }
        it { is_expected.to include(:device_ports) }
      end
      context 'Device ports correct data' do
        subject { payload_crud[:device_ports].last }
        it { is_expected.to include(:port) }
        it { is_expected.to include(:status) }
        it { is_expected.to include(:device_id) }
      end
    end
  end
end