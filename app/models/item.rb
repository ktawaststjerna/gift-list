class Item < ApplicationRecord
  include PipeConcern

  belongs_to :user
  has_many :families, :through => :to_pipes, :source => :from, :source_type => 'Family'

  validates :user, :name, :link, presence: true
  validates :quantity, :numericality => { :greater_than_or_equal_to => 1 }, allow_nil: true

  def buy_item(name)
    if name == user.name
      errors.add(:buy_item, 'Cannot buy your own item. If you would like to remove it, delete the item.')
      return false
    end

    if item_bought || bought_by
      errors.add(:buy_item, "Cannot buy item as it has already been bought by #{bought_by}")
      return false
    end

    update(item_bought: true, bought_by: name)
  end
end