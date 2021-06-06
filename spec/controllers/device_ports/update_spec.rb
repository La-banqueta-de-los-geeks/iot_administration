require 'rails_helper'

RSpec.describe V1::Devices::DevicePortsController, type: :controller do
  describe 'Update device port' do
    let(:device) { create(:device) }
    let(:headers) { { Authorization: "Bearer #{device.device_token}" } }
    let(:device_port) { create(:device_port, device: device) }
    before do
      request.headers.merge! headers
      put(:update, format: :json, params: { device_port: device_port.as_json(only: %i[port status]), id: device_port.id })
    end
    context 'Update device port successfully' do
      context 'Status OK' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
      context 'Payload correct data' do
        subject { payload_crud }
        it { is_expected.to include(:device_port) }
      end
      context 'Device ports correct data' do
        subject { payload_crud[:device_port] }
        it { is_expected.to include(:port) }
        it { is_expected.to include(:status) }
        it { is_expected.to include(:device_id) }
      end
    end
  end
end
