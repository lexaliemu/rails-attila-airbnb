class ChangeTypeRatingToMovies < ActiveRecord::Migration[5.2]
  def change
    change_column :movies, :rating, :integer, :default => 0
  end
end
