class Family < ApplicationRecord
  has_many :users_to_families
  has_many :users, through: :users_to_families

  has_many :items, through: :users

  validates :name, presence: true

  def add_user_to_family(user)
    UsersToFamily.create!(user: user, family: self)
  end
end
