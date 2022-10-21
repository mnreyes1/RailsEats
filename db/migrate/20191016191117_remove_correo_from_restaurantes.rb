class RemoveCorreoFromRestaurantes < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurantes, :correo, :string
  end
end
