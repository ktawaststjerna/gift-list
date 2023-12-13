class User < ApplicationRecord
  has_secure_password

  has_many :users_to_families
  has_many :families, through: :users_to_families

  has_many :family_items, through: :families, source: :items
  has_many :items

  validates :name, presence: true

  def family_items_ordered
    other_family_items = family_items.where(archived: false).where.not(user_id: id).distinct.order(user_id: :asc, item_bought: :desc, created_at: :desc)
    users_family_items = family_items.where(archived: false, user_id: id).distinct.order(created_at: :desc)
    other_family_items + users_family_items
  end
end