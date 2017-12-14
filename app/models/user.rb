class User < ApplicationRecord
  include PipeConcern
  has_secure_password

  has_many :families, :through => :to_pipes, :source => :from, :source_type => 'Family'
  has_many :items

  validates :name, presence: true

  #Great for new users who need items on new families
  def add_items_to_families(family)
    puts "Must be of class family" if family.class != Family
    items.each do |item|
      Pipe.create(from: family, to: item)
    end
  end
end