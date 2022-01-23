require 'rails_helper'

RSpec.describe V1::Devices::DeviceSequencesController, type: :controller do
  describe 'Update device sequences' do
    let(:device) { create(:device) }
    let(:device_group) { create(:device_group, device:device) }
    let(:headers) { { Authorization: "Bearer #{device.device_token}" } }
    let(:device_sequence) { create(:device_sequence, device_group: device_group) }
    before do
      request.headers.merge! headers
      put(:update, format: :json, params: {
            id: device_sequence.id,
            device_group_id: device_sequence.device_group_id,
            device_sequence: device_sequence.as_json(only: [:name])
          })
    end
    context 'Update device sequence successfully' do
      context 'Status OK' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
      context 'Payload correct data' do
        subject { payload_crud }
        it { is_expected.to include(:device_sequence) }
      end
      context 'Device sequence correct data' do
        subject { payload_crud[:device_sequence] }
        it { is_expected.to include(:name) }
        it { is_expected.to include(:device_group_id) }
      end
    end
  end
end
