class Item < ApplicationRecord
  include PipeConcern

  belongs_to :user
  has_many :families, :through => :to_pipes, :source => :from, :source_type => 'Family'
  
  validates :user, :name, :quantity, :link, presence: true
  # validates :family, presence: true
end