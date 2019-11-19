# this file launches a cronjob on serverstart to reset the guestuser account
scheduler = Rufus::Scheduler.new

scheduler.cron '0 7 * * *' do # every day at 7 AM in the morning (Berlin Time)
  # get testuseraccount (if exists)
  if User.testuser.nil?
    print "\n\n\n\n-----Hi from cronscheduler! \nTESTUSER John Doe does NOT exist! creating..."
    User.create(admin: false, password: "123456", first_name: "John",  last_name: "Doe", email: "admin@admin.com")
    puts "finished!"
  else
    print "\n\n\n\n-----Hi from cronscheduler! \nTESTUSER John Doe does exsist! Deleting all his rekos..."
    Reko.where(receiver_id: User.testuser.id).each { |reko| reko.delete }
    puts "finished!"
  end
end

