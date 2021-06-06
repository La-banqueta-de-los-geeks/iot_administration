require 'rails_helper'

RSpec.describe V1::Devices::DevicePortsController, type: :controller do
  describe 'Create device port' do
    let(:device) { create(:device) }
    let(:headers) { { Authorization: "Bearer #{device.device_token}" } }
    before do
      create_list(:device_port, 20, device: device)
      request.headers.merge! headers
      get(:index, format: :json)
    end
    context 'Index device port successfully' do
      context 'Status OK' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
      context 'Payload correct data' do
        subject { payload_crud }
        it { is_expected.to include(:device_ports) }
      end
    end
  end
end
