class Test < ApplicationRecord
  def self.title_by_category(category)
    title_by_category(category).order(title: :desc).pluck(:title)
  end
end
