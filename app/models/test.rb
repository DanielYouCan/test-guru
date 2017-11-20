class Test < ApplicationRecord
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  scope :easy, -> { where(level: 0..1) }
  scope :intermediate, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :by_category, -> (category) { joins(:category).where(categories: {title: category }) }
  scope :descending, -> { order(title: :desc) }
  scope :by_level, -> (level) { where(level: level) }

  def self.tests_by_category(category)
    Test.by_category(category).descending
  end
end
