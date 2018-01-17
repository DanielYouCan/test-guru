class Badge < ApplicationRecord
  has_many :users, through: :badges_users

  RULES = {
    "level" => :level_rule , "category" => :category_rule,
    "attempt" => :attempt_rule
  }

  def self.find_badges(test_passage, user)
    badges = Badge.all
    result = []

    RULES.each do |rule, method|
      result << Badge.send(method, badges, test_passage, user)
    end

    result.flatten.compact
  end

  private

  def self.level_rule(badges, test_passage, user)
    if test_passage.all_in_level?(user)
      badges.select { |b| b.rule_title == "level" && b.rule_value == test_passage.test.level.to_s }
    end
  end

  def self.category_rule(badges, test_passage, user)
    if test_passage.all_in_category?(user)
      badges.select { |b| b.rule_title == "category" && b.rule_value == test_passage.test.category.title }
    end
  end

  def self.attempt_rule(badges, test_passage, user)
    if test_passage.first_attempt?(user)
      badges.select { |b| b.rule_title == "attempt" && b.rule_value == '1' }
    end
  end
  
end
