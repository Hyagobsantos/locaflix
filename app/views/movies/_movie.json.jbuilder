json.extract! movie, :id, :title, :describe, :gender, :created_at, :updated_at
json.url movie_url(movie, format: :json)
