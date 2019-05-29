class RekosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :onboard, :new, :invalid_token]

  def index
    @movies = build_reko_view_array(find_movies_for_user)
  end

  def destroy
    @reko = Reko.find(params[:id])
    @restaurant.destroy
  end

  private

  # make new array of hashes with reko: reko object, sender_names: sender_names array
  # --> make iteration in the view easier
  # def reko_view_array
  #   @rekos = find_rekos_for_user
  #   @rekos = build_reko_view_array(@rekos)
  # end

  # Find rekos, including their movie information, for the current user, ordered by movie title

  def find_movies_for_user
    Reko.includes(:movie).where(receiver_id: current_user.id).order('movies.title')
  end

  def build_reko_view_array(rekos)
    @reko_array = []
    rekos.each do |reko|
      sender_names = pluck_sender_names(reko)
      @reko_array << { reko: reko, sender_names: sender_names } unless title_already_in_list(@reko_array, reko)
    end
    @reko_array.sort_by { |k| k[:sender_names].size }.reverse
  end

  # Find all sender names for a movie, through the different rekos it is tied to
  # --> find names of people who have recommended this movie
  def pluck_sender_names(reko)
    Reko.includes(:movie).where(receiver_id: current_user.id).where(movies: { title: reko.recommendable.title }).order('movies.title').pluck(:sender_name)
  end

  # Check if movie title is already in reko list to avoid duplicates
  def title_already_in_list(array, reko)
    array.select { |r| r[:reko].recommendable.title == reko.recommendable.title }.size.positive?
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

# HELPFUL: ONLY COUNT SENDER NAMES

# def count_rekos
#   Reko.includes(:movie).where(movies: { title: "Percy Jackson: Sea of Monsters" }).order('movies.title').count
# end

# def find_documentaries_for_user
#   Reko.includes(:movie).where(receiver_id: current_user.id).where(movies: { genre: "Documentary" }).order('movies.title')
# end
