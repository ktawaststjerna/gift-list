class User < ApplicationRecord
  has_secure_password

  has_many :families, through: :items

  has_many :items

  validates :name, presence: true
end