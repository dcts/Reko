# Helper methods to display welcome and end message to console
def welcome_message
  puts "\n\n----------\nSTART SEEDING DATABASE! (running SEED.RB file)!\n"
end
def end_message
  puts "FINISHED SEEDING!\n----------\n\n"
end

def reset_database
  puts "deleting all database entries (rekos, movies, users"
  # ordering of the delete operations matters!
  Reko.delete_all
  Movie.delete_all
  User.delete_all
end

def create_user(attr)
  puts "creating user #{attr[:first_name]}"
  User.create!(attr)
end

# CREATE REKO METHOD
# receiver : user-instance
# sender   : name of the sender (sender_name) as string
# content  : instance of a movie / podcast or audiobook
def create_rekos_for_each_user(n)
  User.all.each do |user|
    n.times do
      Reko.create!(
        receiver: user,
        sender_name: Faker::Name.first_name,
        recommendable: Movie.all.sample
      )
      puts "creating #{Reko.last.to_s}"
    end
  end
end

def create_reko(receiver, sender, content)
  r = Reko.new(sender_name: sender)
  r.receiver = receiver
  r.content = content
  r.save!
  puts "creating #{r.to_s}"
end

# save recommendables (array) array to DB
def save_recommendables(recommendables)
  recommendables.each do |recommendable|
    recommendable.save!
    puts "saving #{recommendable.title}"
  end
end
