class User < ApplicationRecord
  include PipeConcern
  has_secure_password

  has_many :families, :through => :to_pipes, :source => :from, :source_type => 'Family'
  has_many :family_items, -> { where(archived: false).distinct }, through: :families, source: :items
  has_many :items

  validates :name, presence: true
end