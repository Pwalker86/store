class CreateStores < ActiveRecord::Migration[8.0]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.string :location
      t.string :phone_number
      t.string :email
      t.string :mission_statement
      t.references(:store_admin, foreign_key: true)

      t.timestamps
    end
  end
end
