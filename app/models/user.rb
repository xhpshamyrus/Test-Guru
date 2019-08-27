class User < ApplicationRecord
  EMAIL_FORMAT = /\A[a-zA-Z0-9._+]+@[a-zA-Zа-яА-Я._+]+\.[a-zа-я]+\z/

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :gists, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_FORMAT }
  #validates :login, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end

  def completed_tests
    tests.where('test_passages.passed = ?', true)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
   is_a?(Admin)
  end
end
