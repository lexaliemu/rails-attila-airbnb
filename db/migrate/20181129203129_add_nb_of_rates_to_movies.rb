class AddNbOfRatesToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :nb_rates, :integer, :default => 0
  end
end
