class AddColumnsToBusinesses < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses, :logo, :string
    add_column :businesses, :cover, :string
    add_column :businesses, :featured, :boolean
  end
end
