# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  locale                 :string           default("es")
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  type                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  organization_id        :bigint
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_organization_id       (organization_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User validations' do
    it 'validate email presence' do
      should validate_presence_of(:email)
    end
    it 'validate password presence' do
      should validate_presence_of(:password)
    end
    it 'Validate only can assing type in Admin or Owner' do
      should validate_inclusion_of(:type).in_array(%w[Admin Owner])
    end
  end
  describe 'Relationships validations' do
    context 'belongs to' do
      it { should belong_to(:organization) }
    end
    context 'associations' do
      it { should have_one(:token) }
    end
  end
end
