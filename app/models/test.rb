class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User', optional: true
  #has_and_belongs_to_many :users

  validates :title, presence: true
  validates_numericality_of :level, only_integer: true, grater_than_or_equal_to: 0
  validates :title, uniqueness: { scope: :level }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :tests_by_category, -> (category) { joins(:category).where(categories: { title: category }) }


  def self.title_by_category(category)
    tests_by_category(category).order(title: :desc).pluck(:title)
  end
end
