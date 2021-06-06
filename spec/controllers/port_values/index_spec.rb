require 'rails_helper'

RSpec.describe V1::Organizations::PortValuesController, type: :controller do
  describe 'Index port values' do
    let(:organization) { create(:organization) }
    let(:headers) { { Authorization: "Bearer #{organization.organization_token}" } }
    let!(:port_values) { create_list(:port_value, 15, organization_id: organization.id) }
    before do
      request.headers.merge! headers
      get(:index, format: :json)
    end
    context 'Index devices successfully' do
      context 'Status OK' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
      context 'Payload correct data' do
        subject { payload_crud }
        it { is_expected.to include(:port_values) }
      end
    end
  end
end
