class AdminsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :users, :user, :rekos, :recommendables, :preferences, :beta_applicants, :tests]
  # if you are an admin, you can see all tables

  def home
    # @
  end

  def users
    @users = User.all
  end

  def user
    @user = User.find(params[:id])
    @visitor_link = "#{request.original_url.split('/admins')[0]}/rekos/new?token=#{@user.token}"
  end

  def rekos
    @rekos = Reko.all
  end

  def recommendables
    # sort by popularity
    @movies = Movie.all_by_popularity
  end

  def preferences
    @preferences = Preference.all
  end

  def beta_applicants
    @beta_applicants = BetaApplicant.all
  end

  def tests

  end
end
