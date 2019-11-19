# require helper functions located in same directory
require_relative 'seeds_helper' # in console run this: $ require_relative 'db/seeds_helper'

# WELCOME
welcome_message

# RESET DATABASE
reset_database

# CREATE USERS
create_user(admin: false, password: "123456", first_name: "John",  last_name: "Doe", email: "admin@admin.com")

# CREATE PREFERENCES
Preference.create!(name: "Movies")
Preference.create!(name: "Documentaries")
Preference.create!(name: "Series")
create_user_preferences # randomly assign user preferences for all users

# POPULATE RECOMMENDABLE
# seed itunes API for movies (documentaries included)
# keywords = [
#   "Blackfish",
#   "Strangers",
#   "Supersize me",
#   "inside Job",
#   "Evolution",
#   "After Passion",
#   "Aladdin",
#   "Avengers",
#   "Black Panther",
#   "Matrix",
#   "Harry Potter",
#   "Spotlight",
#   "Star Wars",
#   "Godfather",
#   "Logan",
#   "Gravity",
#   "Spider Man",
#   "Die Hard",
# ]
# keywords.each do |keyword|
#   recommendables = ItunesApiCallService.new(keyword).call
#   save_recommendables(recommendables)
# end

# CREATE RANDOM REKOS (only for nonadmin fake users) (argument = number of rekos per user)
# create_fake_rekos_for_nonadmin_users(10)

# CREATE RANDOM BETA APPLICANTS (just mail needed) (argument = number of applicants)
# create_beta_applicants(20)

# # dispaly end message to console
end_message
