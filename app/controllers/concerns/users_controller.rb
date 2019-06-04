class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :switch_random_avatar ] #:get_avatar,

  def switch_random_avatar
    @user = User.find(params[:id].to_i)
    @user.update(image_url: nil)
    @user.save
    render json: {
      image_url: ActionController::Base.helpers.asset_path(@user.image_url)
    }
  end

  # def get_avatar
  #   @user = User.find(params[:id].to_i)
  #   render json: {
  #     image_url: ActionController::Base.helpers.asset_path('random_avatars/1.png')
  #   }
  # rescue ActiveRecord::RecordNotFound
  #   render json: { mgs: "Error, no user with id #{params[:id]}" }
  # end
end
