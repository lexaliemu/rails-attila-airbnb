class AddRateToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :rate, :integer
  end
end
