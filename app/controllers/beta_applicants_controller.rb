class BetaApplicantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @beta_applicant = BetaApplicant.new
  end

  def create
    @beta_applicant = BetaApplicant.new(email: params[:email])
    if @beta_applicant.save
      redirect_to root_path
    end
  end
end
