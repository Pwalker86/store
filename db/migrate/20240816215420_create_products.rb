class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.text :description, null: false
      t.boolean :out_of_stock, default: false

      t.timestamps
    end
  end
end
