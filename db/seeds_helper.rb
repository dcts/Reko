# Helper methods to display welcome and end message to console
def welcome_message
  puts "\n\n----------\nSTART SEEDING DATABASE! (running SEED.RB file)!\n"
end
def end_message
  puts "FINISHED SEEDING!\n----------\n\n"
end

def reset_database
  puts "deleting all database entries (rekos, movies, podcasts, audiobooks, users"
  # ordering of the delete operations matters!
  Reko.delete_all
  Movie.delete_all
  Podcast.delete_all
  Audiobook.delete_all
  User.delete_all
end

def create_user(attr)
  puts "creating user #{attr[:first_name]}"
  User.create!(attr)
end

# creates movie instances from an array of titles and saves them
def create_movies(movie_titles)
  print "creating movies     "
  movie_titles.each do |movie_title|
    Movie.create!(title: movie_title)
    print "*"
  end
  puts " done!"
end

# creates podcast instances from an array of titles and saves them
def create_podcasts(podcast_titles)
  print "creating podcasts   "
  podcast_titles.each do |podcast_title|
    Podcast.create!(title: podcast_title)
    print "*"
  end
  puts " done!"
end

# creates audiobook instances from an array of titles and saves them
def create_audiobooks(audiobook_titles)
  print "creating audiobooks "
  audiobook_titles.each do |audiobook_title|
    Audiobook.create!(title: audiobook_title)
    print "*"
  end
  puts " done!"
end

# CREATE REKO METHOD
# asker  : user-instance
# teller : name of the teller (teller_name) as string
# content: instance of a movie / podcast or audiobook
def create_reko(asker, teller, content)
  r = Reko.new(teller_name: teller)
  r.asker = asker
  r.content = content
  r.save!
  puts "creating #{r.to_s}"
end

