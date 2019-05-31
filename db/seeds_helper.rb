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
  UserPreference.delete_all
  Preference.delete_all
  Reko.delete_all
  Movie.delete_all
  User.delete_all
end

def create_user(attr)
  puts "creating user #{attr[:first_name]}"
  User.create!(attr)
end

def create_preferences(preference_names)
  preference_names.each do |name|
    Preference.create!(name: name)
    puts "creating preference category #{name}"
  end
end

# CREATE USER PREFERENCES
# randomly assignment of user preferences
# 33%: Movies
# 33%: Documentaris
# 33%: Movies + Documentaries
def create_user_preferences
  movie_pref = Preference.where(name: "Movies").first # get preference instance with name "Movies"
  doc_pref = Preference.where(name: "Documentaries").first # get preference instance with name "Documentaries"
  User.all.each do |user|
    puts "creating user preferences for user #{user.to_s}"
    random = rand
    add_preferences(user, [movie_pref]) if random <= 0.33
    add_preferences(user, [doc_pref]) if random > 0.33 && random <= 0.66
    add_preferences(user, [movie_pref, doc_pref]) if random > 0.66
  end
end
def add_preferences(user, pref_arr)
  pref_arr.each { |pref| UserPreference.create!(user: user, preference: pref)}
end

# CREATE REKO METHOD -> applied only for non admin users!
# receiver : user-instance
# sender   : name of the sender (sender_name) as string
# content  : instance of a movie / podcast or audiobook
def create_fake_rekos_for_nonadmin_users(n)
  non_admin_users = User.where(admin: false)
  non_admin_users.each do |user|  # for each user
    n.times do                    # create n rekos
      Reko.create!(
        receiver: user,
        sender_name: Faker::Name.first_name,
        recommendable: Movie.all.sample
      )
      puts "creating #{Reko.last.to_s}"
    end
  end
end

# save recommendables (array) array to DB
def save_recommendables(recommendables)
  recommendables.each do |recommendable|
    recommendable.save!
    puts "saving #{recommendable.title}"
  end
end

def create_beta_applicants(n)
  n.times do
    BetaApplicant.create!(email: Faker::Internet.email)
    puts "creating fake beta applicant #{BetaApplicant.last.email}"
  end
end
