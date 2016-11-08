class Item < ApplicationRecord
  belongs_to :user
  belongs_to :family

  validates :user, :name, :quantity, :link, presence: true
  validates :family, presence: true
end
