class SearchDetailsMovieJob < ApplicationJob
  queue_as :default

  def perform(movie)
    details = SearchDetailsMovies.new.search(movie.title)
    movie.img = details[:image]
    movie.year = details[:year]

    movie.save if movie.img.present? && movie.year.present?
  end
end
