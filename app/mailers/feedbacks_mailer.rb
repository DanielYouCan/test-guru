class FeedbacksMailer < ApplicationMailer
  def feedback_message(feedback)
    @feedback = feedback

    mail to: "danyurkanskiy@gmail.com"
  end
end
