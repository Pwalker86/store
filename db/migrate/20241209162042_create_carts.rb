class CreateCarts < ActiveRecord::Migration[8.0]
  def change
    create_table :carts do |t|
      t.belongs_to :user, null: true, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
