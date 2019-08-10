class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)

    if @feedback.save
      FeedbacksMailer.send_feedback(@feedback).deliver_now
      redirect_to root_path, notice: 'Feedback created and was sent!'
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :body, :user_id)
  end
end
