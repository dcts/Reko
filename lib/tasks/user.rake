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
  task :random_avatar => :environment do
    User.all.each { |user| user.save! } # will run the validation for image_url!
  end
end
