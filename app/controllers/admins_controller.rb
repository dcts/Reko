class AdminsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :users, :rekos, :recommendables, :preferences, :beta_applicants]
  # if you are an admin, you can see all tables

  def home
    # @
  end

  def users
    @users = User.all
  end

  def rekos
    @rekos = "working"
  end

  def recommendables
    @recommendables = "working"
  end

  def preferences
    @preferences = "working"
  end

  def beta_applicants
    @beta_applicants = "working"
  end
end
