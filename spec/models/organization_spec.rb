# frozen_string_literal: true

# == Schema Information
# Schema version: 20210530061319
#
# Table name: organizations
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'validations in User' do
    it 'validate name presence' do
      should validate_presence_of(:name)
    end

    it 'validate name uniqueness' do
      should validate_uniqueness_of(:name)
    end

    describe 'Relationships validations' do
      context 'associations' do
        it { should have_many(:admins) }
        it { should have_one(:owner) }
        it { should have_one(:token) }
      end
    end
  end
end
