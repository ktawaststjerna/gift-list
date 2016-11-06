class User < ApplicationRecord
  has_secure_password
  
  belongs_to :clinic

  has_many :list, dependent: :destroy

  validates :name, presence: true
end