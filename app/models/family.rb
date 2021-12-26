class Family < ApplicationRecord
  include PipeConcern

  has_many :users, :through => :from_pipes, :source => :to, :source_type => 'User'
  has_many :users_to_families
  # has_many :users, through: :users_to_families # Uncomment after migration 20211226151934 and rake task run

  has_many :items, through: :users

  validates :name, presence: true
end
