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
  #belongs_to :user
  has_one :owner
  has_many :admins
  #validations
  validates :name, presence: true, uniqueness: true
end
