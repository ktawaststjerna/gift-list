class Pipe < ApplicationRecord
  belongs_to :from, polymorphic: true
  belongs_to :to, polymorphic: true

  validates :from, :to, presence: true
end