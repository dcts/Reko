class RekosController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :onboarding, :search, :new, :invalid_token, :create ]

  def index
    @user_movies = Reko.left_outer_joins(:movie).where(receiver_id: current_user.id)
    @movies = sort_rekos(@user_movies.open, @user_movies.done)
    @visitor_link = request.original_url.gsub("/rekos", "/rekos/new/onboarding?token=#{current_user.token}")
  end

  def onboarding
    @token = params[:token] # get token from params
    @sender_name = params[:sender_name] # grab sender_name from params
    @user = User.find_by_token(params[:token]) # returns user instance or nil
    if @user.nil?
      redirect_to invalid_token_path
    else
      @user_preferences = @user.preferences.map { |preference| preference[:name] }
    end
  end

  # def search
  #   @token = params[:token] # get token from params
  #   @sender_name = params[:sender_name] # grab sender_name from params
  #   @user = User.find_by_token(params[:token]) # returns user instance or nil
  #   if @user.nil?
  #     redirect_to invalid_token_path
  #   end
  # end

  def new
    @search_term = params[:search_term] # grab sender_name from params
    @base = ENV['BASE']
    @classifier = ENV['CLASSIFIER']
    # if user_signed_in? == false
    @token = params[:token] # get token from params
    @sender_name = params[:sender_name] # get sender name if provided
    user_id = User.token_hashmap[@token] # returns user instance or nil
    if user_id.nil? # User not existant -> token invalid
      # authenticate_user!
      redirect_to invalid_token_path
    else
      @user = User.find(user_id)
    end
    # end
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
        puts "----------------------------------MOVVIEE CREATED\n\n\n"
      end
      # create reko
      Reko.create(
        receiver: receiver,
        sender_name: data[:sender_name],
        recommendable: movie
      )
      puts "creating #{Reko.last.to_s}"
      puts "----------------------------------REKO CREATED\n\n\n"
    else
      puts "\n not a valid movie! Reko is not created!"
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
