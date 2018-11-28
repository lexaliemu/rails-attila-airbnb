class ChangeTypeOfFieldOnMovies < ActiveRecord::Migration[5.2]
  def change
    change_column :movies, :title, :string
    change_column :movies, :description, :string
  end
end
