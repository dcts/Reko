class UserPreferencesController < ApplicationController

  def show
    @user_preference = UserPreference.find(params[:id])
  end

  def new
    @user = current_user
    @user_preference = UserPreference.new
  end

  def create
    #This returns an array of integers with selected preference ids!
    x=params[:user_preferences].map(&:to_i)
    raise

    if params[:user_preferences]
      pref = UserPreference.where(user_id: current_user.id)
      pref.each do |p|
        p.destroy!
      end

      # @user_preference =  UserPreference.new(user_preference_params)
      @preferences = Preference.find(params[:user_preference][:preference_ids])
      @user = current_user

        @user_preference = UserPreference.new
      @user_preference.user = @user
      @preferences.each do |preference|
        @user_preference.preference = preference
      end
      @user_preference.save
      redirect_to rekos_path
      # @user_preference.user = current_user
      # raise
      # if @user_preferences.save
      #   redirect_to user_preferences_path(@user_preferences)
      # else
      #   render :new
      # end
    else
      render :new
    end
  end

  private

  def user_preference_params
    params.require(:user_preference).permit(:preference_ids)
  end
end
