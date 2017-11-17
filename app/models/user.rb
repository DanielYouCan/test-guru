class User < ApplicationRecord
  has_and_belongs_to_many :tests

  def tests_list(level)
    Test.joins(:users_tests).where("level = :level AND user_id = :user_id", level: level, user_id: self.id)
  end
end
