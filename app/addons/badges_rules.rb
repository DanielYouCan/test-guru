class BadgesRules
  attr_reader :user, :test_passage

  def initialize(user, test_passage)
    @user = user
    @test_passage = test_passage
  end

  def level_rule(badge_level)
    self.all_in_level?(badge_level)
  end

  def category_rule(badge_category)
    self.all_in_category?(badge_category)
  end

  def attempt_rule(badge_attempt)
    self.first_attempt? && badge_attempt == '1'
  end

  protected

  def first_attempt?
    passages = user.test_passages.where(test_id: test_passage.test_id)
    passages.count == 1 && test_passage.passed
  end

  def all_in_category?(category)
    cat_id = Category.where(title: category)
    Test.by_category(category).count == user.test_passages.joins(:test).where(tests: { category: cat_id }).passed.distinct.pluck(:test_id).count
  end

  def all_in_level?(level)
    Test.by_level(level).count == user.test_passages.joins(:test).where(tests: { level: level}).passed.distinct.pluck(:test_id).count
  end

end
