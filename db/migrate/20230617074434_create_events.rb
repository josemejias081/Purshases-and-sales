class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :date
      t.string :location
      t.string :speaker
      t.string :portrait
      t.boolean :cost
      t.boolean :modality, default: false

      t.timestamps
    end
  end
end
