class RedirectionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :run ]

  def run
    token_short = params[:token_short]
    token_hashmap_short = User.token_hashmap_short

    target_user = token_hashmap_short[token_short]
    # raise
    if target_user
      redirect_to rekos_new_onboarding_path(token: target_user.token)
    else
      redirect_to invalid_token_path
    # redirect_to
    end
  end
end

