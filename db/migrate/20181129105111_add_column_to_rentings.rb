class AddColumnToRentings < ActiveRecord::Migration[5.2]
  def change
    add_column :rentings, :status, :boolean
  end
end
