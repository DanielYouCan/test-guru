class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :authored_tests, class_name: 'Test'

  validates :email, presence: true

  def tests_list(level)
    tests.by_level
  end
end
