require 'rails_helper'

RSpec.describe V1::DevicesController, type: :controller do
  describe 'Index devices' do
    let(:user) { create(:owner) }
    let(:headers) { { Authorization: "Bearer #{user.user_token}" } }
    let!(:devices) { create_list(:device, 15, organization_id: user.organization_id) }
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
        it { is_expected.to include(:devices) }
      end
    end
  end
end
