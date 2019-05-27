class BetaApplicantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    @beta_applicant = BetaApplicant.new(email: params[:email])
    if @beta_applicant.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
