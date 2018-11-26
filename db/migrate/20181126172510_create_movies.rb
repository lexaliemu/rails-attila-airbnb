class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.text :title
      t.integer :release_date
      t.integer :duration
      t.text :description
      t.text :synopsis
      t.string :director
      t.string :cover
      t.integer :price
      t.integer :rating
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
