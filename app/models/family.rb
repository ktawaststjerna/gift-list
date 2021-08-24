class Family < ApplicationRecord
  include PipeConcern

  has_many :users, :through => :from_pipes, :source => :to, :source_type => 'User'
  has_many :items, through: :users

  validates :name, presence: true
end
