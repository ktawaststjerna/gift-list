class User < ApplicationRecord
  has_secure_password

  has_many :users_to_families
  has_many :families, through: :users_to_families

  has_many :family_items, -> { where(archived: false).distinct.order(:user_id) }, through: :families, source: :items
  has_many :items

  validates :name, presence: true
end