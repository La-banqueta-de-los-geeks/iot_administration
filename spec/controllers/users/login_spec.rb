require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  describe 'Login user' do
    let!(:organization) { create(:organization) }
    let!(:password) { Faker::Alphanumeric.alphanumeric(number: 10) }
    let!(:owner) { create(:owner, password: password, organization: organization) }
    let!(:payload) { { user: { email: owner.email, password: password } } }
    context 'create user success' do
      before do
        post(:login, format: :json, params: payload)
      end
      context 'payload is correct' do
        subject { payload_crud }
        it { is_expected.to include(:user) }
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
      context 'Correct token payload' do
        subject { payload_crud[:user][:token] }
        it { is_expected.to include(:token) }
      end
      context 'response' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
    end
  end
end
