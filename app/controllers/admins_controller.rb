class AdminsController < ApplicationController
  skip_before_action :authenticate_user!, only: [
      :home,
      :users,
      :user,
      :rekos,
      :recommendables,
      :preferences,
      :beta_applicants,
      :tests,
      :feedbacks,
      :allan,
    ]
  # if you are an admin, you can see all tables
  # before_action :authenticate_admin
  before_action :set_color

  def home
    # @
  end

  def users
    @users = User.all.order(:id)
  end

  def user
    @user = User.find(params[:id])
    @visitor_link = "#{request.original_url.split('/admins')[0]}/rekos/new/onboarding?token=#{@user.token}"
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
    @authenticity_token = session[:_csrf_token]
  end

  def allan
  end

  def feedbacks
    @feedbacks = Feedback.all
  end
  # def search
  #   @image_urls = Movie.all.map { |movie| movie.image_url }
  # end

  def authenticate_admin
    unless current_user&.admin? # user is not admin
      redirect_to root_path
    end
  end

  def set_color
    @current_bg = 'white'
  end
end
