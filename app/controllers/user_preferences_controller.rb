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
    preference_ids=params[:user_preferences].map(&:to_i)
    if params[:user_preferences]
      pref = UserPreference.where(user_id: current_user.id)
      pref.each { |p| p.destroy! }
      # @user_preference =  UserPreference.new(user_preference_params)
      @preferences = Preference.where("id IN (#{preference_ids.join(',')})")
      @user = current_user
      @preferences.each do |pref|
        user_preference = UserPreference.create(user:@user, preference:pref)
      end
      redirect_to rekos_path
    else
      render :new
    end
  end

  private

  def user_preference_params
    params.require(:user_preference).permit(:preference_ids)
  end
end
