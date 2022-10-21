json.extract! comentario, :id, :fecha, :hora, :contenido, :puntaje, :user_id, :restaurante_id, :plato_id, :created_at, :updated_at
json.url comentario_url(comentario, format: :json)
