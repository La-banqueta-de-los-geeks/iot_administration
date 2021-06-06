require 'rails_helper'

RSpec.describe V1::DevicesController, type: :controller do
  describe 'Update devices' do
    let(:user) { create(:owner) }
    let(:device) { create(:device, organization_id: user.organization_id) }
    let(:headers) { { Authorization: "Bearer #{user.user_token}" } }
    before do
      request.headers.merge! headers
      device.name = Faker::Games::Pokemon.name
      put(:update, format: :json, params: { device: device.as_json, id: device.id })
    end
    context 'Updated device successfully' do
      context 'Status OK' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
      context 'Payload correct data' do
        subject { payload_crud }
        it { is_expected.to include(:device) }
      end
      context 'Device correct data' do
        subject { payload_crud[:device] }
        it { is_expected.to include(:name) }
        it { is_expected.to include(:status) }
        it { is_expected.to include(:organization_id) }
        it { is_expected.to include(:device_token) }
      end
    end
    context 'Failed device update' do
      before do
        device.name = nil
        request.headers.merge! headers
        put(:update, format: :json, params: { device: device.as_json, id: device.id })
      end
      context 'Status BAD REQUEST' do
        subject { response }
        it { is_expected.to have_http_status(:bad_request) }
      end
      context 'Estructura del lista de errores correcto' do
        subject { payload_crud }
        it { is_expected.to include(:errors) }
      end
    end
  end
end
