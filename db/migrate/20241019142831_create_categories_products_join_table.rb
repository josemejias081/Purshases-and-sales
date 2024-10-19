class CreateCategoriesProductsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_products, id: false do |t| # id: false porque no necesitamos un id primario en esta tabla
      t.belongs_to :category
      t.belongs_to :product
    end

    add_index :categories_products, [:category_id, :product_id], unique: true # Evita duplicados
  end
end
