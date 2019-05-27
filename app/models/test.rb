class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User', optional:true

  def self.title_by_category(category)
    Test.joins('INNER JOIN categories ON tests.category_id = categories.id').where(categories: {title: category}).order(title: :desc).pluck(:title)
  end
end
