# Reko

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

rails g migration AddFirstNameAndLastNameToUsers first_name:string last_name:string
```
