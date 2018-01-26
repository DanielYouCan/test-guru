class BadgesSelector

  def self.select_badges(test_passage, user)
    badges = Badge.all
    result = []

    badges.each do |badge|
      select_badge(badge, test_passage, user, result) if can_be_selected?(user, badge, test_passage)
    end
    result.flatten.compact
  end

  def self.select_badge(badge, test_passage, user, result)
    setup = BadgesRules.new(user, test_passage)

    case badge.rule_title
    when 'level'
      result << badge if setup.level_rule(badge.rule_value) && badge.rule_value == test_passage.test.level.to_s
    when 'attempt'
      result << badge if setup.attempt_rule(badge.rule_value)
    when 'category'
      result << badge if setup.category_rule(badge.rule_value) && badge.rule_value == test_passage.test.category.title
    end

  end

  private

  def self.can_be_selected?(user, badge, test_passage)
    user.badges.exclude?(badge) || badge.rule_title == 'attempt' || user.test_passages.passed.where("test_id = :test_id AND updated_at < :time", test_id: test_passage.test.id, time: 5.second.ago).empty?
  end

end
