class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.user = current_user

    if @feedback.save
      FeedbacksMailer.feedback_message(@feedback).deliver_now
      flash[:notice] = "Your message has been successfully send"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :body)
  end

end
