class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float :precio
      t.string :medio_pago
      t.text :direccion
      t.time :hora_entrega
      t.string :estado
      t.text :info
      t.references :user, foreign_key: true
      t.references :restaurante, foreign_key: true

      t.timestamps
    end
  end
end