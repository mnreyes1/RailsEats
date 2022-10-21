Rails.application.routes.draw do
  resources :orders
  resources :comentarios
  resources :platos
  devise_for :users
  devise_for :restaurantes
  get 'home/index'
  get 'solicitudes', to: 'restaurantes#solicitudes'
  post 'aprobar/:id', to: 'restaurantes#aprobar_solicitud', as: 'aprobar'
  post 'enviar_pedido/:id', to: 'orders#enviar_pedido', as: 'enviar_pedido'
  post 'finalizar_pedido/:id', to: 'orders#finalizar_pedido', as: 'finalizar_pedido'
  get 'pago/:restaurante_id', to: 'orders#pago', as: 'pago'
  get 'mis_platos', to: 'restaurantes#mis_platos', as: 'mis_platos'
  get 'mis_comentarios', to: 'restaurantes#mis_comentarios', as: 'mis_comentarios'
  get 'mis_ordenes', to: 'restaurantes#mis_ordenes', as: 'mis_ordenes'
  post 'add_fav/:id/:nombre', to: 'users#add_fav', as: 'add_fav'
  post 'delete_fav/:nombre', to: 'users#delete_fav', as: 'delete_fav'
  get 'pedidos_usuario', to: 'users#pedidos_usuario', as: 'pedidos_usuario'
  get 'fav', to: 'users#fav', as: 'fav'
  post 'pedir_plato/:id', to: 'platos#pedir_plato', as: 'pedir_plato'
  resources :restaurantes
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
