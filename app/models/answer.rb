class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_answers_count, on: :create

  private

  def validate_answers_count
    errors.add(:answer, "Не более 4 ответов") if question.answers.count >= 4
  end
end
