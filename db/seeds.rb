# require helper functions
# use the following when you want to require helper methods inside the rails console
# > require_relative 'db/seeds_helper'
require_relative 'seeds_helper'
require_relative '../app/services/itunes_api_call_service'

Movie.delete_all
Documentary.delete_all
puts "deleted movies and documentaries"

keywords = [
  "Blackfish",
  "Strangers",
  "Supersize me",
  "inside Job",
  "Evolution",
  "After Passion",
  "Aladdin",
  "Avengers",
  "Black Panther",
  "Matrix",
  "Harry Potter",
  "Spotlight",
  "Star Wars",
  "Godfather",
  "Logan",
  "Gravity",
  "Spider Man",
  "Die Hard",
]

keywords.each do |search_term|
  content = ItunesApiCallService.new(search_term).call
  save_content_arr(content)
end


# api_service = ItunesApiCallService.new("Scarface")
# m = api_service.call
# m.save!
# api_service = ItunesApiCallService.new("Big lebowski")
# m = api_service.call
# m.save!
# api_service = ItunesApiCallService.new("Bourne")
# m = api_service.call
# m.save!
# api_service = ItunesApiCallService.new("Matrix")
# m = api_service.call
# m.save!
# api_service = ItunesApiCallService.new("Lion King")
# m = api_service.call
# m.save!




puts "END!"

# # display message to console
# welcome_message

# # RESET DATABASE
# reset_database

# # CREATE USERS
# create_user(password: "123456", first_name: 'Allan',   last_name: 'Holmes',     email: 'allan.homes@me.com')
# create_user(password: "123456", first_name: 'Assunta', last_name: 'Waldorf',    email: 'sunti@mail.com')
# create_user(password: "123456", first_name: 'Thilo',   last_name: 'Somthing',   email: 'thiloooo@reko.com')
# create_user(password: "123456", first_name: 'Thomas',  last_name: 'Starzynski', email: 'thommy-star@hotmail.com')

# # OLD SEED FILE!
# # create_movies(["Breaking Bad", "Some Documentary", "Scarface"])
# # create_podcasts(["best podcast ever", "crypto podcast", "podcast nr 3", "Tim Ferris"])
# # create_audiobooks(["Homo Deus", "21 Lessons for the 21st Century"])

# # CREATE ONE MOVIE


# # CREATE REKOS
# # rekos for thomas from allan
# asker = User.where(first_name: "Thomas")[0] # asker
# create_reko(asker, "Allan", Movie.new(title: "Three Random Strangers"))
# create_reko(asker, "Allan", Audiobook.new(title: "The Magic Of Thinking Big"))
# # rekos for allan from thomas
# asker = User.where(first_name: "Allan")[0]
# create_reko(asker, "Thomas", Audiobook.new(title: "Sapiens"))

# # dispaly end message to console
# end_message
