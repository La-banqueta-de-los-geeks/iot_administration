# == Schema Information
#
# Table name: tokens
#
#  id          :bigint           not null, primary key
#  entity_type :string
#  expires_at  :datetime
#  token       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  entity_id   :bigint
#
# Indexes
#
#  index_tokens_on_entity_type_and_entity_id  (entity_type,entity_id)
#
FactoryBot.define do
  factory :token do
    token { SecureRandom.hex }
  end
end
