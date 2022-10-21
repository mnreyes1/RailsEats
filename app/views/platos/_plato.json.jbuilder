json.extract! plato, :id, :nombre, :precio, :descripcion, :n_personas, :imagenes, :photo, :valoracion, :restaurante_id, :created_at, :updated_at
json.url plato_url(plato, format: :json)
