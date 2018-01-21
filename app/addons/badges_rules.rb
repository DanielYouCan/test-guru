class BadgesRules
  attr_reader :user, :test_passage

  def initialize(user, test_passage)
    @user = user
    @test_passage = test_passage
  end

  def level_rule(badge_level)
    self.all_in_level? && badge_level == test_passage.test.level.to_s
  end

  def category_rule(badge_category)
    self.all_in_category? && badge_category == test_passage.test.category.title
  end

  def attempt_rule(badge_attempt)
    self.first_attempt? && badge_attempt == '1'
  end

  protected

  def first_attempt?
    passages = user.test_passages.passed.where("test_id = :test_id", test_id: test_passage.test_id)
    passages.count == 1
  end

  def all_in_category?
    all_tests_ids = Test.all.where("category_id = :category_id", category_id: test_passage.test.category_id).ids
    passages = user.test_passages.passed
    cat_passages = passages.select { |t| t.test.category_id == test_passage.test.category_id }
    users_tests_ids = cat_passages.pluck(:test_id).uniq

    all_tests_ids == users_tests_ids
  end

  def all_in_level?
    all_tests_ids = Test.by_level(test_passage.test.level).ids
    passages = user.test_passages.passed
    cat_passages = passages.select { |t| t.test.level == test_passage.test.level }
    users_tests_ids = cat_passages.pluck(:test_id).uniq

    all_tests_ids == users_tests_ids
  end


end
