# Reset Database
Movie.delete_all
Podcast.delete_all
List.delete_all
User.delete_all

# Create Users
users = []
users << User.new(password: "123456", first_name: 'Allan', last_name: 'Holmes', email: 'allan.homes@me.com')
users << User.new(password: "123456", first_name: 'Assunta', last_name: 'Waldorf', email: 'sunti@mail.com')
users << User.new(password: "123456", first_name: 'Thilo', last_name: 'Somthing', email: 'thiloooo@reko.com')
users << User.new(password: "123456", first_name: 'Thomas', last_name: 'Starzynski', email: 'thommy-star@hotmail.com')
users.each { |user| user.save! }

# Create a list for each user
users.each do |user|
  l = List.new
  l.owner = user
  l.save!
end

# create some movies
Movie.create!(title: "Three Random Strangers")
Movie.create!(title: "Breaking Bad")
Movie.create!(title: "Some Documentary")
Movie.create!(title: "Scarface")

Podcast.create!(title: "best podcast ever")
Podcast.create!(title: "crypto podcast")
Podcast.create!(title: "podcast nr 3")

# Create rekos and add them to a specific list!
