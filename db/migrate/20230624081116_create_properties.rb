class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.integer :type_property, default: 0
      t.decimal :area
      t.integer :roof, default: 0
      t.integer :floor, default: 0
      t.integer :bedroom, default: 0
      t.integer :bathroom, default: 0
      t.string :location
      t.text :special_feature
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
