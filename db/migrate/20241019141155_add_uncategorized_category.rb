class AddUncategorizedCategory < ActiveRecord::Migration[7.0]
  def up
    Category.create(name: 'Sin Categorizar', icon: 'fa-question') # Inserta la categoría
  end

  def down
    Category.find_by(name: 'Sin Categorizar')&.destroy # Elimina la categoría si existe
  end
end
