module QuestionsHelper

  def question_header(question)
    if question.new_record?
      "Create New Question: #{@test.title} "
    else
      "Edit Question #{question.test.title}"
    end
  end
end
