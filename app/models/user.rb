class User < ApplicationRecord
  EMAIL_FORMAT = /\A[a-zA-Z0-9._+]+@[a-zA-Zа-яА-Я._+]+\.[a-zа-я]+\z/

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :gists

  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_FORMAT }
  #validates :login, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
   is_a?(Admin)
  end
end
