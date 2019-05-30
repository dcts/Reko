namespace :user do
  desc "resets all rekos of a give user"
  task :reset, [:user_id] => :environment do | t, args |
    user = User.find(args[:user_id])
    user.rekos_received.each do |reko|
      puts "deleting reko: \"#{reko.to_s}\""
      reko.destroy!
    end
  end
end
