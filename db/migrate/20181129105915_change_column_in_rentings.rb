class ChangeColumnInRentings < ActiveRecord::Migration[5.2]
  def change
    change_column :rentings, :status, :boolean, :defaul => false
  end
end
