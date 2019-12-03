class Item < ApplicationRecord
  include PipeConcern

  belongs_to :user
  has_many :families, :through => :to_pipes, :source => :from, :source_type => 'Family'

  validates :user, :name, :link, presence: true

  def buy_item(name)
    errors.add(:buy_item, 'Cannot buy your own item. If you would like to remove it, delete the item.') if name == user.name
    errors.add(:buy_item, "Cannot buy item as it has already been bought by #{bought_by}") if item_bought || bought_by
    return false if errors.present?

    update(item_bought: true, bought_by: name)
  end
end