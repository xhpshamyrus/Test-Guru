class Test < ApplicationRecord

  def self.title_by_category(category)
    Test.joins('INNER JOIN categories ON tests.category_id = categories.id').where(categories: {title: category}).order(title: :desc).pluck(:title)
  end
end
