class AddStoreToProducts < ActiveRecord::Migration[8.0]
  def change
    add_reference :products, :store, null: false, foreign_key: true, default: 1
  end
end
