require 'rails_helper'

RSpec.describe V1::Devices::DeviceGroupsController, type: :controller do
  describe 'Update device groups' do
    let(:device) { create(:device) }
    let(:headers) { { Authorization: "Bearer #{device.device_token}" } }
    let(:device_group) { create(:device_group, device: device) }
    before do
      request.headers.merge! headers
      put(:update, format: :json, params: {
            id: device_group.id,
            device_group: device_group.as_json(only: [:name])
          })
    end
    context 'Update device group successfully' do
      context 'Status OK' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
      context 'Payload correct data' do
        subject { payload_crud }
        it { is_expected.to include(:device_group) }
      end
      context 'Device group correct data' do
        subject { payload_crud[:device_group] }
        it { is_expected.to include(:name) }
        it { is_expected.to include(:device_id) }
      end
    end
  end
end
