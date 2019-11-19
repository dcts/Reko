# SCRIPT TO DELETE FILES ON SERVER
# log in to server from commandline
# => $ heroku run rails console

# define users
user_ids = [9,10,12,17,18,20,21,22,23,24,26,27,32,33,35,37,53,55,57,60,61,62,66,67,68,69,70,71,72,73,74,75,75,76,77,78,79,80,81,82,83,84,84,85,86,87,88,89,110,160,161,162,163]

# delete user rekos first
Reko.where(receiver_id: user_ids).each { |reko| reko.delete }

# delete users
user_ids.each { |user_id| User.find(user_id).delete if User.exists?(user_id) }
