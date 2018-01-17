class TestPassage < ApplicationRecord
  attr_accessor :questions_amount

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_current_question

  def completed?
    current_question.nil?
  end

  def first_attempt?(user)
    passages = user.test_passages.where("test_id = :test_id",test_id: test_id)
    comp_passages = passages.select { |p| p.passed? }
    comp_passages.count == 1
  end

  def all_in_category?(user)
    all_tests_ids = Test.all.where("category_id = :category", category: test.category_id).ids
    passages = user.test_passages
    cat_passages = passages.select { |t| t.test.category_id == test.category_id && t.passed? }
    users_tests_ids = cat_passages.map(&:test).map(&:id).uniq

    all_tests_ids == users_tests_ids
  end

  def all_in_level?(user)
    all_tests_ids = Test.all.where("level = :level", level: test.level).ids
    passages = user.test_passages
    cat_passages = passages.select { |t| t.test.level == test.level && t.passed? }
    users_tests_ids = cat_passages.map(&:test).map(&:id).uniq

    all_tests_ids == users_tests_ids
  end

  def passed?
    @result ||= correct_questions.to_f / test.questions_count * 100
    completed? && @result > 85.0
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  private

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_update_set_current_question
    self.current_question = next_question
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

end
