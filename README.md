# SendRekos

- Friends know best
- Backend Controlpanel
- [Wiki page](https://github.com/dcts/reko/wiki)


```bash
rails new \
  --database postgresql \
  --webpack \
  -m https://raw.githubusercontent.com/lewagon/rails-templates/master/devise.rb \
  --skip-active-storage \
  reko


# genereate rest of the models
rails g model movie title
rails g model podcast title
rails g model audiobook title
rails g model serie title
rails g model documentary title


# generate controllers
rails g controller users
rails g controller rekos
rails g controller inbox

```
