class AddMinimunbidToProducts < ActiveRecord::Migration
  def change
    add_column :products, :min_bid, :float
  end
end
