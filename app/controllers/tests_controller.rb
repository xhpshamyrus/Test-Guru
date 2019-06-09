class TestsController < ApplicationController

  before_action :find_test, only: %i[show edit update destroy]

  def index
    @tests = Test.all
    #render plain: @tests.inspect
  end

  def show
    #@test = Test.find(params[:id])
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def edit
    #@test = Test.find(params[:id])
  end

  def destroy
    @test = Test.find(params[:id])

    @test.destroy
    redirect_to tests_path
  end

  def update
    @test = Test.find(params[:id])

    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
