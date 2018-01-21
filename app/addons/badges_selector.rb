class BadgesSelector

  def self.select_badges(test_passage, user)
    badges = Badge.all
    result = []

    badges.each do |badge|
      select_badge(badge, test_passage, user, result)
    end
    result.flatten.compact
  end

  def self.select_badge(badge, test_passage, user, result)
    setup = BadgesRules.new(user, test_passage)

    case badge.rule_title
    when 'level'
      result << badge if setup.level_rule(badge.rule_value)
    when 'attempt'
      result << badge if setup.attempt_rule(badge.rule_value)
    when 'category'
      result << badge if setup.category_rule(badge.rule_value)
    end

  end

end
