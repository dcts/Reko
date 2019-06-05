namespace :user do
  desc "resets all rekos of a give user"
  task :reset, [:user_id] => :environment do | t, args |
    user = User.find(args[:user_id])
    user.rekos_received.each do |reko|
      puts "deleting reko: \"#{reko.to_s}\""
      reko.destroy!
    end
  end

  desc "assigns random avatars if image_url is nil"
  task :fill_empty_avatars => :environment do
    User.all.each do |user|
      user.save! # will run the validation for image_url!
      puts "reassigning image_url for #{user.to_s}"
    end
  end

  desc "reassigns all random avatars for all users"
  task :reassign_random_avatars => :environment do
    User.all.each do |user|
      user.update(image_url: nil)
      user.save!
      puts "reassigning image_url for #{user.to_s}"
    end
  end
end
