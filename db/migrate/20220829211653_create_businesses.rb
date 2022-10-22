class CreateBusinesses < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :rif
      t.string :address
      t.string :phone
      t.string :email
      t.string :ig
      t.string :fb
      t.string :location
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
