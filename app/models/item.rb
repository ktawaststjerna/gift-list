class Item < ApplicationRecord
  belongs_to :user

  validates :name, :quantity, :link, presence: true
end
