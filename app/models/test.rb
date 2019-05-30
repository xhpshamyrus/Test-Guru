class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User', optional:true

  scope :tests_by_category, -> (category) { joins.(category).where(categories: { title: category })}
  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level}
  validates :level, numericality: { only_integer: true, grater_than_or_equal: 0 }

  def self.title_by_category(category)
    tests_by_category(category).order(title: :desc).pluck(:title)
  end
end
