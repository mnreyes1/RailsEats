class AddRestaurantesFavoritosToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rest_fav, :string, array: true, default: []
  end
end
