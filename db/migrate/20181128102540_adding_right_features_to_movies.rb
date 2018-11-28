class AddingRightFeaturesToMovies < ActiveRecord::Migration[5.2]
  def change
    change_column :movies, :duration, :string
    remove_column :movies, :synopsis
    add_column :movies, :category, :string
  end
end
