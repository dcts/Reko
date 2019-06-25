class RekosController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :onboarding, :new, :invalid_token, :create ]

  def index
    @current_bg = '#464646'
    # token authentication!
    @owner_token = params[:owner_token]
    redirect_to(root_path) && return if @owner_token.nil?
    redirect_to(invalid_token_path) && return if User.owner_token_invalid?(@owner_token)
    @current_user = User.find_by_owner_token(@owner_token) # analog to devise's current_user
    # get data for inbox
    @user_movies = Reko.left_outer_joins(:movie).where(receiver_id: @current_user.id)
    @movies = sort_rekos(@user_movies.open, @user_movies.done)
    @visitor_link = request.original_url.gsub("/rekos", "/s/#{@current_user.token_short}")
  end

  def onboarding
    @current_bg = '#f5f5f5'
    validate_token_and_get_receiver
    # WHO IS SENDING?
    @sender_name = "" # default: empty sender_name
    @sender_name = params[:sender_name] if params[:sender_name] # if querystring exists
  end

  def new
    @current_bg = '#1E1E1E'
    # ----------------------------
    # IMPORTANT: whenever "new" route gets called from inbox, we need to pass:
    # - redirect_home: true
    # - sender_name: YOU
    # ----------------------------
    validate_token_and_get_receiver
    # load sender_name!
    @sender_name = params[:sender_name]
    #load data from EVN variables
    @base = ENV['BASE']
    @classifier = ENV['CLASSIFIER']
    # redirection path
    @redirect_home = params[:redirect_home] == "true"
  end

  def create
    # PERMIT PARAMS (filter only the needed ones)
    data = request_params
    # get receiver (User instance) # CODE SMELL -> REFACTOR THIS!
    # receiver = user_signed_in? ? current_user : User.find_by_token(data[:token])
    receiver = User.find_by_token(data[:token])
    # check if movie is valid!
    if data[:itunes_id] && data[:image_url]
      # check if movie exists already (check with itunes id)?
      # create if not, otherwise get movie instance
      movie = Movie.find_by(itunes_id: data[:itunes_id].to_i)
      if movie.nil? && data[:itunes_id] && data[:image_url]
        movie = Movie.new(
          title: data[:title],
          itunes_id: data[:itunes_id].to_i,
          image_url: data[:image_url],
          genre: data[:genre]
        )
        movie.save
        # puts "----------------------------------MOVVIEE CREATED\n\n\n"
      end
      # create reko
      Reko.create(
        receiver: receiver,
        sender_name: data[:sender_name],
        recommendable: movie
      )
      # puts "creating #{Reko.last.to_s}"
      # puts "----------------------------------REKO CREATED\n\n\n"
    else
      # puts "\n not a valid movie! Reko is not created!"
    end
  end

  def mark_as_rejected
    @reko = Reko.find(params[:reko_id])
    # Reko.where(receiver_id: params[:receiver_id]).where(recommendable_id: @reko.recommendable_id).update_all(status: 'rejected')
    @reko.rejected!

    if @reko.save
      respond_to do |format|
        format.js
        format.html
      end
    end
  end

  def mark_as_done
    @reko = Reko.find(params[:reko_id])
    @reko.status = 'done'
    if @reko.save
      respond_to do |format|
        format.js
        format.html
      end
    end
  end

  private

  # HELPER FUNCTION THAT LOADS THE FOLLOWING VARIABLES
  # - @token (validates it first)
  # - @user (who is the receiver of the rekos?)
  # - @user_preferences (what are his preferences?)
  def validate_token_and_get_receiver
    # CHECK TOKEN VALIDITY
    @token = params[:token]
    redirect_to(invalid_token_path) && return if User.token_invalid?(@token)
    # WHO IS THE RECEIVER?
    @user = User.find_by_token(@token) # returns user instance
    # get preferences of user requesting the rekos
    @user_preferences = @user.preferences.map { |preference| preference.name }
  end

  def request_params
    params.require(:reko).permit(:sender_name, :token, :itunes_id, :title, :image_url, :genre)
  end

  # make new array of hashes with reko: reko object, sender_names: sender_names array
  # --> make iteration in the view easier
  # def reko_view_array
  #   @rekos = find_rekos_for_user
  #   @rekos = build_reko_view_array(@rekos)
  # end

  # Find all sender names for a movie, through the different rekos it is tied to
  # --> find names of people who have recommended this movie
  def pluck_sender_names(reko)
    @user_movies.where(movies: { id: reko.recommendable.id }).pluck(:sender_name).uniq
  end

  # HERE BE DRAGONS
  def sort_rekos(open_rekos, done_rekos)
    result = []

    open_rekos.each do |reko|
      sender_names = pluck_sender_names(reko)
      result << { reko: reko, sender_names: sender_names } unless recommendable_already_in_list(result, reko)
    end

    result = result.sort_by { |k| k[:sender_names].size }.reverse

    done_rekos.each do |reko|
      sender_names = pluck_sender_names(reko)
      result << { reko: reko, sender_names: sender_names } unless recommendable_already_in_list(result, reko)
    end

    result
  end

  # Check if movie recommendable is already in reko list to avoid duplicates
  def recommendable_already_in_list(array, reko)
    array.select { |r| r[:reko].recommendable.id == reko.recommendable.id }.size.positive?
  end
end

# HELPFUL: ONLY COUNT SENDER NAMES

# def count_rekos
#   Reko.includes(:movie).where(movies: { title: "Percy Jackson: Sea of Monsters" }).order('movies.title').count
# end

# def find_documentaries_for_user
#   Reko.includes(:movie).where(receiver_id: current_user.id).where(movies: { genre: "Documentary" }).order('movies.title')
# end
