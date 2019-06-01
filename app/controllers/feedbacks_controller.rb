class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def create
    @feedback = Feedback.new(params[:content])
  end
end
