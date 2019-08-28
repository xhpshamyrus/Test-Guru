class BadgeService

  CATEGORY_TITLE = "Математика"
  REGULATION_LEVEL = 2

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call_badge
    Badge.all.each { |badge| send("#{badge.rule_type}_complete?", badge)}
  end

  def category_complete?(badge)
    @user.badges << badge if category_type(CATEGORY_TITLE)
  end

  def first_attempt_complete?(badge)
    @user.badges << badge if attempt(@test)
  end

  def level_complete?(badge)
    @user.badges << badge if level(REGULATION_LEVEL)
  end

  def category_type(category)
    Test.title_by_category(category).count == @user.completed_tests.title_by_category(category).uniq.count
  end

  def level(level)
    Test.where(level: level).count == @user.tests.where(level: level).uniq.count
  end

  def attempt(test)
    @test_passage.passed == true && @user.tests.where(title: @test.title).count == 1
  end
end
