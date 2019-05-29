class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :thankyou]

  def home
  end

  def thankyou
    @receiver = User.find_by_token(params[:token])
    @sender_name = params[:name]
    if @receiver.nil?
      redirect_to root_path
    end
  end
end
