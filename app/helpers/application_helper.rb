module ApplicationHelper

  # ADDING THESE 3 METHODS SUCH THAT WE CAN USE THE DEVISE VIEWS FROM OUTSIDE
  # resource here: https://stackoverflow.com/a/6393151/6272061
  # check if this is a security thread with Andy!
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
