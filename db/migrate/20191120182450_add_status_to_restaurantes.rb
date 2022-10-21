class AddStatusToRestaurantes < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurantes, :status, :string, default: "pendiente"
  end
end
