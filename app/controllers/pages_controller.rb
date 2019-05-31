class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :thankyou]

  def home
    @invited = params[:invite] == ENV['INVITATION_LINK_TOKEN_1']
  end

  def thankyou
    @token = params[:token]
    @receiver = User.find_by_token(@token)
    @sender_name = params[:name]
    @movies = params[:movies].split("_and_")
    # redirect if token is invalid
    redirect_to(root_path) if @receiver.nil?
  end

end
