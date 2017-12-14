class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  has_many :gists

  validates :body, presence: true
  validates :answers, length: { maximum: 4 }
end
