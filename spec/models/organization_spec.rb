# frozen_string_literal: true

# == Schema Information
#
# Table name: organizations
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_organizations_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'validations in User' do
    it 'validate presence of required fields' do
      should validate_presence_of(:name)
      should validate_uniqueness_of(:name)
    end
    context 'associations' do
      it { should belong_to(:user) }
    end
  end
end
