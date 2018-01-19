class Badge < ApplicationRecord
  has_many :users, through: :badges_users

end
