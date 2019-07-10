class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[show edit update destroy]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def destroy
    @test.destroy
    redirect_to admin_test_path, notice: t('.delete')
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test), notice: t('.update')
    else
      render :edit
    end
  end

  def create
    @test = current_user.author_tests.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: t('.create',author_first_name: current_user.first_name,
                                                              author_last_name: current_user.last_name )
    else
      render :new
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
