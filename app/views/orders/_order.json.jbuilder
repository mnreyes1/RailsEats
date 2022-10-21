json.extract! order, :id, :plato_id, :precio, :medio_pago, :direccion, :hora_entrega, :estado, :info, :user_id, :restaurante_id, :created_at, :updated_at
json.url order_url(order, format: :json)
