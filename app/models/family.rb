class Family < ApplicationRecord
  include PipeConcern

  has_many :items, :through => :from_pipes, :source => :to, :source_type => 'Item'
  has_many :users, :through => :from_pipes, :source => :to, :source_type => 'User'

  validates :name, presence: true
end
