require 'rails_helper'

RSpec.describe V1::Organizations::PortValuesController, type: :controller do
  describe 'Create port values' do
    let(:organization) { create(:organization) }
    let(:headers) { { Authorization: "Bearer #{organization.organization_token}" } }
    let(:port_value) { build(:port_value) }
    before do
      request.headers.merge! headers
      post(:create, format: :json, params: { port_value: port_value.as_json })
    end
    context 'Create port value successfully' do
      context 'Status CREATED' do
        subject { response }
        it { is_expected.to have_http_status(:created) }
      end
      context 'Payload correct data' do
        subject { payload_crud }
        it { is_expected.to include(:port_value) }
      end
      context 'Port value correct data' do
        subject { payload_crud[:port_value] }
        it { is_expected.to include(:name) }
        it { is_expected.to include(:value) }
        it { is_expected.to include(:organization_id) }
      end
    end
    context 'Failed port value update' do
      before do
        request.headers.merge! headers
        port_value.name = nil
        post(:create, format: :json, params: { port_value: port_value.as_json })
      end
      context 'Status BAD REQUEST' do
        subject { response }
        it { is_expected.to have_http_status(:bad_request) }
      end
      context 'Payload errors correct data' do
        subject { payload_crud }
        it { is_expected.to include(:errors) }
      end
    end
  end
end
