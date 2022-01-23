require 'rails_helper'

RSpec.describe V1::Devices::SequencesController, type: :controller do
  describe 'Create sequences' do
    let(:device) { create(:device) }
    let(:device_port) { create(:device_port, device: device) }
    let(:device_group) { create(:device_group, device: device) }
    let(:port_value) { create(:port_value, organization: device.organization) }
    let(:device_sequence) { create(:device_sequence, device_group: device_group) }
    let(:headers) { { Authorization: "Bearer #{device.device_token}" } }
    let(:sequence) { build(:sequence, device_sequence: device_sequence, port_value: port_value, device_port: device_port) }
    before do
      request.headers.merge! headers
      post(:create, format: :json, params: { device_group_id: device_group.id, device_sequence_id: device_sequence.id, sequence: sequence.as_json(only: %i[port_value_id device_port_id]) })
    end
    context 'Create sequence successfully' do
      context 'Status CREATED' do
        subject { response }
        it { is_expected.to have_http_status(:created) }
      end
      context 'Payload correct data' do
        subject { payload_crud }
        it { is_expected.to include(:sequence) }
      end
      context 'sequence correct data' do
        subject { payload_crud[:sequence] }
        it { is_expected.to include(:port_value_id) }
        it { is_expected.to include(:device_sequence_id) }
        it { is_expected.to include(:device_port_id) }
      end
    end
  end
end
