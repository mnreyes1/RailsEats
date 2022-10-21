class CreatePlatos < ActiveRecord::Migration[5.2]
  def change
    create_table :platos do |t|
      t.string :nombre
      t.integer :precio
      t.text :descripcion
      t.integer :n_personas
      t.string :imagenes
      t.float :valoracion
      t.references :restaurante, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
