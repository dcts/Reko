class RekosController < ApplicationController
  # REMARK (thomas):
  # -> index page needs user to be logged in, so once we are finished with
  # development we need to remove it from this list here!
  skip_before_action :authenticate_user!, only: [ :index, :new, :invalid_token, :create ]

  def index
    @movies = build_reko_view_array(find_movies_for_user)
  end


  def new
    token = params[:token] # get token from params
    user_id = User.token_hashmap[token] # returns user instance or nil
    if user_id.nil? # User not existant -> token invalid
      redirect_to invalid_token_path
    else
      @user = User.find(user_id)
    end
  end

  def create
    # PERMIT PARAMS (filter only the needed ones)
    data = request_params
    # get receiver (User instance)
    receiver = User.find(User.token_hashmap[data[:token]])
    # check if movie exists already (check with itunes id)?
    movie = Movie.find_by(itunes_id: data[:itunes_id].to_i)
    # create if not, otherwise get movie instance
    if movie.nil?
      movie = Movie.new(
        title: data[:title],
        itunes_id: data[:itunes_id].to_i,
        image_url: data[:image_url],
        genre: data[:genre]
      )
      movie.save
    end
    # create reko!
    Reko.create(
      receiver: receiver,
      sender_name: data[:sender_name],
      recommendable: movie
    )
    puts "creating #{Reko.last.to_s}"
  end
  
  def destroy
    @reko = Reko.find(params[:id])
    @restaurant.destroy
  end

  private

  def request_params
    params.require(:reko).permit(:sender_name, :token, :itunes_id, :title, :image_url, :genre)
  end

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
end

# HELPFUL: ONLY COUNT SENDER NAMES

# def count_rekos
#   Reko.includes(:movie).where(movies: { title: "Percy Jackson: Sea of Monsters" }).order('movies.title').count
# end

# def find_documentaries_for_user
#   Reko.includes(:movie).where(receiver_id: current_user.id).where(movies: { genre: "Documentary" }).order('movies.title')
# end
