class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :brand
      t.string :model
      t.decimal :amount, :precision => 6, :scale => 2
      t.references :seller, index: true
      t.references :buyer, index: true

      t.timestamps
    end
  end
end
