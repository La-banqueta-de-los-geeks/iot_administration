require 'rails_helper'

RSpec.describe V1::Devices::DeviceSequencesController, type: :controller do
  describe 'Create device sequences' do
    let(:device) { create(:device) }
    let(:headers) { { Authorization: "Bearer #{device.device_token}" } }
    let(:device_sequence) { build(:device_sequence, device: device) }
    before do
      request.headers.merge! headers
      post(:create, format: :json, params: { device_sequence: device_sequence.as_json(only: [:name]) })
    end
    context 'Create device sequence successfully' do
      context 'Status CREATED' do
        subject { response }
        it { is_expected.to have_http_status(:created) }
      end
      context 'Payload correct data' do
        subject { payload_crud }
        it { is_expected.to include(:device_sequence) }
      end
      context 'Device sequence correct data' do
        subject { payload_crud[:device_sequence] }
        it { is_expected.to include(:name) }
        it { is_expected.to include(:device_id) }
      end
    end
  end
end
