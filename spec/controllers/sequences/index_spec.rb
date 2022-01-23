require 'rails_helper'

RSpec.describe V1::Devices::SequencesController, type: :controller do
  describe 'Create sequences' do
    let(:device) { create(:device) }
    let(:device_port) { create(:device_port, device: device) }
    let(:device_group) { create(:device_group, device: device) }
    let(:port_value) { create(:port_value, organization: device.organization) }
    let(:device_sequence) { create(:device_sequence, device_group: device_group) }
    let(:headers) { { Authorization: "Bearer #{device.device_token}" } }
    let(:sequences) { create_list(:sequence, 10, device_sequence: device_sequence, port_value: port_value, device_port: device_port) }
    before do
      request.headers.merge! headers
      get(:index, format: :json, params: { device_group_id: device_group.id, device_sequence_id: device_sequence.id } ) 
    end
    context 'Create sequence successfully' do
      context 'Status CREATED' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
      context 'Payload correct data' do
        subject { payload_crud }
        it { is_expected.to include(:sequences) }
        #sequences
      end
    end
  end
end
