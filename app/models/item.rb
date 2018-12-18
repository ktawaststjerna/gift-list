class Item < ApplicationRecord
  include PipeConcern

  belongs_to :user
  has_many :families, :through => :to_pipes, :source => :from, :source_type => 'Family'

  validates :user, :name, :link, presence: true
end