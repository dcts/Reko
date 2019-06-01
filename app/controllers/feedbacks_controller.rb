class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.save!
  end

  def feedback_params
    params.require(:feedback).permit(:content)
  end
end
