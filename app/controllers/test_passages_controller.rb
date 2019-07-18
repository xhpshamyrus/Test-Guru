class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage), notice: t('.completed')
    else
      render :show
    end
  end

  def gist
    question = @test_passage.current_question
    result = GistQuestionService.new(question)
    result = result.call
    url = result.html_url

    current_user.gists.create(question: question, url: url)

    redirect_to @test_passage, notice: t('.success', url: url)
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
