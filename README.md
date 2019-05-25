# SendRekos

- Friends know best
- Backend Controlpanel


```bash
rails new \
  --database postgresql \
  --webpack \
  -m https://raw.githubusercontent.com/lewagon/rails-templates/master/devise.rb \
  --skip-active-storage \
  reko

rails g controller users show index

# user is created by devise -> add columns with a db migration!
rails g migration AddFirstNameAndLastNameToUsers first_name:string last_name:string
# genereate rest of the models
rails g model list token name user:references # then manually change the alias in the model!
rails g model movie title
rails g model podcast title
rails g model audiobook title
rails g model reko list:references creator_name # reko already taken?!?!

# generate controllers
rails g controller lists
rails g controller rekos
```
