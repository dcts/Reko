class RekosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :onboard, :new, :invalid_token]

  def index
    @rekos = Reko.where(receiver_id: current_user.id)
  end

  def onboard

  end

  def new
    # raise
    token = params[:token] # get token from params
    user_id = User.token_hashmap[token] # returns user instance or nil
    if user_id.nil? # User not existant -> token invalid
      redirect_to invalid_token_path
    else
      @user = User.find(user_id)
    end
  end

  def invalid_token

  end
end
