class InboxesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  # shows the reko-inbox of the asker
  def show
    token = params[:token]
    # get user_id of the corresponding token
    user_id = User.token_hashmap[params[:token]]
    # check if user_id and therefore the token exists
    if user_id
      @user = User.find(user_id)
    else
      redirect_to root_path
    end
  end
end
