namespace :movie do
  desc "deletes all movies and related rekos from the database (CAUTION!)"
  task :delete_all => :environment do
    movies = Movie.all
    movies.each do |movie|
      puts "...deleting movie #{movie.title}"
      movie.destroy
    end
    puts "done!"
  end
end
