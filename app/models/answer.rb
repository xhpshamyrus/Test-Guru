class Answer < ApplicationRecord
  MAX_ANSWERS = 4

  belongs_to :question

  scope :correct_answers, -> { where(correct: true) }

  validate :validate_max_answers on: :create
  validates :body, presence: true

  private

  def validate_max_answers
    errors.add(:answer, 'Не может быть более 4 ответов') if question.answer.count >= MAX_ANSWERS
  end
end
