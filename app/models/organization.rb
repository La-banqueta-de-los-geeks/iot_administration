# == Schema Information
#
# Table name: organizations
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Organization < ApplicationRecord
  include TokenConcerns
  #belongs_to :user
  has_one :owner
  has_many :admins
  has_many :devices
  has_many :port_values
  has_one :token, as: :entity
  after_create :generate_token

  #validations
  validates :name, presence: true, uniqueness: true
end
