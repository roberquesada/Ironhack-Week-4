class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.references :product, index: true
      t.references :user
      t.float :amount
      t.timestamps null: false
    end
  end
end
