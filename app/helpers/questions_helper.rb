module QuestionsHelper

  def question_header(question)
    if question.new_record?
      "Create New Question: #{@test.title} "
    else
      "Edit Question #{question.test.title}"
    end
  end

  def current_year
    Time.current.year
  end

  def github_link(author, repo)
    link_to 'Test-Guru', "https://github.com/#{author}/#{repo}", target: "_blank"
  end
end
