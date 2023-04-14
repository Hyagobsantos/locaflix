class AddFkToMovies < ActiveRecord::Migration[7.0]
  def change
    add_reference :movies, :comment, foreign_key: true
  end
end
