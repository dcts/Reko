
# SendRekos

- Friends know best
- Backend Controlpanel
- [Wiki page](https://github.com/dcts/reko/wiki)


### Notes
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
rails g controller content
rails g controller user_preferences

rails g migration addImageUrlToUsers image_url:string

```


ITUNES API
```ruby
# MOVIES / DOCUMENTARIES
data["results"][0]["kind"] # => "feature-movie"
data["results"][0]["wrapperType"] # => "track"

if data["results"][0]["primaryGenreName"] == "Documentary"

data["results"][0]["trackName"]              # title
data["results"][0]["trackId"].to_i           # itunes_id
data["results"][0]["artworkUrl100"]          # image_url
data["results"][0]["releaseDate"][0..3].to_i # year

# SERIES
data["results"][0]["wrapperType"] # => "collection"
data["results"][0]["collectionType"] # => "TV Season"

data["results"][0]["artistName"] # title
data["results"][0]["collectionName"] # grab the "Season X" out and put it in the title
data["results"][0]["collectionId"] # itunes_id
data["results"][0]["collectionId"] # itunes_id
data["results"][0]["artworkUrl100"] # image_url
data["results"][0]["releaseDate"][0..3].to_i # year



# AUDIOBOOKS



# PODCASTS


```
