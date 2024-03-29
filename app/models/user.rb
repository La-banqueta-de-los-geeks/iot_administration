# == Schema Information
# Schema version: 20210530061319
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
class User < ApplicationRecord
  include TokenConcerns
  after_create :generate_token
  # Delegates
  delegate :token, to: :token, prefix: :user, allow_nil: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Relationships
  belongs_to :organization
  has_one :token, as: :entity
  # Nested attributes
  accepts_nested_attributes_for :organization
  # Validations
  validates :email, uniqueness: true, presence: true, on: :create
  validates :password, presence: true, on: :create
  validates_inclusion_of :type, in: %w[Owner Admin]
end
