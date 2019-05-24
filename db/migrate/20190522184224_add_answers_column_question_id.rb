class AddAnswersColumnQuestionId < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :questions_id, :integer
  end
end
