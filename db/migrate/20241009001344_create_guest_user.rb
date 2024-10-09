class CreateGuestUser < ActiveRecord::Migration[7.1]
  def change
    create_table :guests do |t|
      t.string :email
      t.references :order, null: true, foreign_key: true
      t.timestamps

    end
  end
end

