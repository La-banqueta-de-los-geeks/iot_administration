require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  describe 'Create user with her organization' do
    let!(:user) { { user: { email: Faker::Internet.email, password: Faker::Alphanumeric.alphanumeric(number: 10) } } }
    context 'create user success' do
      before do
        post(:create, format: :json, params: user)
      end
      context 'payload is correct' do
        subject { payload_crud }
        it { is_expected.to include(:user) }
        it { is_expected.to include(:token) }
        it { is_expected.to include(:organization) }
      end
      context 'Correct user payload' do
        subject { payload_crud[:user] }
        it { is_expected.to include(:id) }
        it { is_expected.to include(:email) }
        it { is_expected.to include(:created_at) }
        it { is_expected.to include(:updated_at) }
      end
      context 'Correct organization payload' do
        subject { payload_crud[:organization] }
        it { is_expected.to include(:id) }
        it { is_expected.to include(:name) }
        it { is_expected.to include(:created_at) }
        it { is_expected.to include(:updated_at) }
      end
      context 'response' do
        subject { response }
        it { is_expected.to have_http_status(:created) }
      end
    end
  end
end
