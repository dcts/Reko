class AdminsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:users] #, :rekos, :recommendables, :preferences, :beta_applicants]
  # if you are an admin, you can see all tables

  def users
    @users = User.all
  end

  # def rekos

  # end

  # def recommendables

  # end

  # def preferences
  #   @prefernces = Preference.all
  # end

  # def beta_applicants

  # end
end
