class Test < ApplicationRecord
  has_many :questions
  has_many :answers
  has_and_belongs_to_many :users
  belongs_to :category

  def self.tests_by_category(category)
    Test.joins(:category).where(categories: { title: category }).order(title: :desc)
  end
end
