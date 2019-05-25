puts "\n\n----------\nSEEDING DATABASE! (running SEED.RB file)!"
# Reset Database
puts "deleting all database entries (rekos, movies, podcasts, audiobooks, lists, users"
Reko.delete_all
Movie.delete_all
Podcast.delete_all
Audiobook.delete_all
List.delete_all
User.delete_all

# Create Users
puts "creating users"
users = []
users << User.new(password: "123456", first_name: 'Allan', last_name: 'Holmes', email: 'allan.homes@me.com')
users << User.new(password: "123456", first_name: 'Assunta', last_name: 'Waldorf', email: 'sunti@mail.com')
users << User.new(password: "123456", first_name: 'Thilo', last_name: 'Somthing', email: 'thiloooo@reko.com')
users << User.new(password: "123456", first_name: 'Thomas', last_name: 'Starzynski', email: 'thommy-star@hotmail.com')
users.each { |user| user.save! }

# Create a list for each user
puts "creating a list for each user"
User.all.each do |user|
  list = List.new(title: "#{user.first_name} list")
  list.owner = user
  list.save!
end

# CREATE CONTENT
# create some movies
puts "creating movies"
movie_titles = ["Three Random Strangers", "Breaking Bad", "Some Documentary", "Scarface"]
movie_titles.each do |movie_title|
  Movie.create!(title: movie_title)
  print "*"
end
puts " done!"

# create some podcasts
puts "creating podcasts"
podcast_titles = ["best podcast ever", "crypto podcast", "podcast nr 3", "Tim Ferris"]
podcast_titles.each do |podcast_title|
  Podcast.create!(title: podcast_title)
  print "*"
end
puts " done!"

# create some audiobooks
puts "creating audiobooks"
audiobook_titles = ["Sapiens", "Homo Deus", "The Magic Of Thinking Big", "21 Lessons for the 21st Century"]
audiobook_titles.each do |audiobook_title|
  Audiobook.create!(title: audiobook_title)
  print "*"
end
puts " done!"

# Create rekos and add them to a specific list!
# REKO FROM ALLAN TO THOMAS
puts "creating rekos"
r = Reko.new(creator_name: "Allan")
r.list = List.where(title: "Thomas list").first
r.content = Audiobook.where(title: "The Magic Of Thinking Big").first
r.save!
print "*"

r = Reko.new(creator_name: "Allan")
r.list = List.where(title: "Thomas list").first
r.content = Movie.where(title: "Three Random Strangers").first
r.save!
print "*"

r = Reko.new(creator_name: "Thomas")
r.list = List.where(title: "Allan list").first
r.content = Audiobook.where(title: "Sapiens").first
r.save!
print "*"


