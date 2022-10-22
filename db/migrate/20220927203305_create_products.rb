class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :presentation
      t.string :image
      t.boolean :featured
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end
