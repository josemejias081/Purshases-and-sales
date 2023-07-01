class AddColumnsToProperty < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :portrait, :string
    add_column :properties, :phone, :string
    add_column :properties, :status, :integer, default: 0
  end
end
