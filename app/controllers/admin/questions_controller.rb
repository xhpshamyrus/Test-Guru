class Admin::QuestionsController < Admin::BaseController

  before_action :authenticate_user!
  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
    #@answers = @question.answers
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to admin_question_path(@question), notice: "Question has been added!"
    else
      render :new
    end
  end

    def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question), notice: "Question has been updated!"
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @question.destroy
    redirect_to admin_tests_path(@question.test), notice: "Question has been deleted!"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден', ststus: 404
  end
end
