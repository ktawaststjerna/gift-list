class User < ApplicationRecord
  include PipeConcern
  has_secure_password

  has_many :families, :through => :to_pipes, :source => :from, :source_type => 'Family'
  has_many :items

  validates :name, presence: true

  def family_items
    families.map(&:items).flatten.uniq
  end
end