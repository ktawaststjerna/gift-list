class UsersToFamily < ApplicationRecord
  belongs_to :user
  belongs_to :family
end
