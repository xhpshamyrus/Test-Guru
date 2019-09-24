class TestPassage < ApplicationRecord
  SUCCESS = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update
  before_validation :before_validation_set_timer, on: :create

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def success?
    calculation >= SUCCESS
  end

  def test_questions_count
    test.questions.count
  end

  def calculation
    self.correct_questions * 100 / test_questions_count
  end

  def question_index
    test.questions.index(current_question) + 1
  end

  def total_questions
    test.questions.size
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def before_validation_set_timer
    self.timer = test.time_period
  end


  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids != nil
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.nil? ? 0 : current_question.id).first
    #test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
