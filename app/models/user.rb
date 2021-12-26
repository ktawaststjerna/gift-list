class User < ApplicationRecord
  include PipeConcern
  has_secure_password

  has_many :families, :through => :to_pipes, :source => :from, :source_type => 'Family'

  has_many :users_to_families
  # has_many :families, through: :users_to_families # Uncomment after migration 20211226151934 and rake task run

  has_many :family_items, -> { where(archived: false).distinct.order(:user_id) }, through: :families, source: :items
  has_many :items

  validates :name, presence: true
end