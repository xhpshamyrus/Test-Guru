class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test), notice: "You pass #{@test.title}"
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
