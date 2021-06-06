require 'rails_helper'

RSpec.describe V1::DevicesController, type: :controller do
  describe 'Create devices' do
    let(:user) { create(:owner) }
    let(:headers) { { Authorization: "Bearer #{user.token.token}" } }
    let(:device) { build(:device) }
    before do
      request.headers.merge! headers
      post(:create, format: :json, params: { device: device.as_json })
    end
    context 'Create device successfully' do
      context 'Status CREATED' do
        subject { response }
        it { is_expected.to have_http_status(:created) }
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
        request.headers.merge! headers
        device.name = nil
        post(:create, format: :json, params: { device: device.as_json })
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
