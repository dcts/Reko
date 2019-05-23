# Reset Database
User.delete_all

# Create Users
User.create!(password: "123456", first_name: 'Allan', last_name: 'Holmes', email: 'allan.homes@me.com')
User.create!(password: "123456", first_name: 'Assunta', last_name: 'Waldorf', email: 'sunti@mail.com')
User.create!(password: "123456", first_name: 'Thilo', last_name: 'Somthing', email: 'thiloooo@reko.com')
User.create!(password: "123456", first_name: 'Thomas', last_name: 'Starzynski', email: 'thommy-star@hotmail.com')
