class AddColumnToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :price, :decimal, precision: 5, scale: 2
    add_column :events, :status, :integer, default: 0
  end
end
