class Admin::TestsController < Admin::BaseController

before_action :set_tests, only: %i[index update_inline]
before_action :set_test, only: %i[show edit update destroy update_inline]

  def index
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
    redirect_to admin_tests_path, notice: t('.delete')
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test), notice: t('.update')
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
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

  def set_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :time_period)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
