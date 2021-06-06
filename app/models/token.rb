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
class Token < ApplicationRecord
  belongs_to :entity, polymorphic: true
  before_create :generate_token
  validates :entity_type, :entity_id, presence: true

  def is_valid?
    DateTime.now < self.expires_at
  end

  private

  def generate_token
    begin
      self.token = SecureRandom.hex(20)
    end while Token.where(token: self.token).any?
  end
end
