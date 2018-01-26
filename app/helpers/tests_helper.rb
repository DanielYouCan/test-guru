module TestsHelper
  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

  def test_duration(test)
    test.duration.nil? ? content_tag(:td, t('.usual')) : content_tag(:td, t('.minutes', count: test.duration))
  end

end
