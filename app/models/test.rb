class Test < ApplicationRecord
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  scope :easy, -> { where(level: 0..1) }
  scope :intermediate, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  def self.tests_by_category(category)
    Test.joins(:category).where(categories: { title: category }).order(title: :desc)
  end
end
