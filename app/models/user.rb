class User < ApplicationRecord

  devise :database_authenticatable,
        :registerable,
        :recoverable,
        :rememberable,
        :trackable,
        :validatable,
        :confirmable

  has_many :test_passages
  has_many :gists
  has_many :feedbacks
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test'
  has_many :badges_users
  has_many :badges, through: :badges_users

  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def add_gist(question, url)
    self.gists.create(question: question, gist_url: url)
  end

  def is_admin?
    is_a?(Admin)
  end

end
