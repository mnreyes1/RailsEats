class CreateComentarios < ActiveRecord::Migration[5.2]
  def change
    create_table :comentarios do |t|
      t.string :fecha
      t.string :hora
      t.string :contenido
      t.integer :puntaje
      t.references :user, foreign_key: true
      t.references :restaurante, foreign_key: true
      t.references :plato, foreign_key: true

      t.timestamps
    end
  end
end
