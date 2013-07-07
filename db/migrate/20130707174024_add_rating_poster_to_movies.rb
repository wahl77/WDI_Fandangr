class AddRatingPosterToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :poster, :string
    add_column :movies, :rating, :string
  end
end
