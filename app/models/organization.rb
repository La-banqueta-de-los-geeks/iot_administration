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
class Organization < ApplicationRecord
  belongs_to :user
  #validations
  validates :name, presence: true, uniqueness: true
end
