namespace :reko do
  desc "deletes all rekos and all movies from the database (CAUTION!)"
  task :delete_all => :environment do
    Reko.delete_all
    puts "all rekos deleted!"
    Movie.delete_all
    puts "all movies deleted!"
  end
end
