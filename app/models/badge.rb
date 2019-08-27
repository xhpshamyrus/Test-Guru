class Badge < ApplicationRecord
  RULES = %w[category level first_attempt].freeze

  has_many :users, through: :user_badges
  has_many :user_badges, dependent: :destroy

  validates :title, presence: true
end
