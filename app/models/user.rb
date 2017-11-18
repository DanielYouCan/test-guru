class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :authored_tests, class_name: 'Test'

  def tests_list(level)
    Test.joins(:users_tests).where("level = :level AND user_id = :user_id", level: level, user_id: self.id)
  end

end
