# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_10_172954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "comentarios", force: :cascade do |t|
    t.string "fecha"
    t.string "hora"
    t.string "contenido"
    t.integer "puntaje"
    t.bigint "user_id"
    t.bigint "restaurante_id"
    t.bigint "plato_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plato_id"], name: "index_comentarios_on_plato_id"
    t.index ["restaurante_id"], name: "index_comentarios_on_restaurante_id"
    t.index ["user_id"], name: "index_comentarios_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.float "precio"
    t.string "medio_pago"
    t.text "direccion"
    t.time "hora_entrega"
    t.string "estado"
    t.text "info"
    t.bigint "user_id"
    t.bigint "restaurante_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurante_id"], name: "index_orders_on_restaurante_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "platos", force: :cascade do |t|
    t.string "nombre"
    t.integer "precio"
    t.text "descripcion"
    t.integer "n_personas"
    t.string "imagenes"
    t.float "valoracion"
    t.bigint "restaurante_id"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_platos_on_order_id"
    t.index ["restaurante_id"], name: "index_platos_on_restaurante_id"
  end

  create_table "restaurantes", force: :cascade do |t|
    t.string "nombre"
    t.string "direccion"
    t.float "valoracion"
    t.string "imagen"
    t.string "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "status", default: "pendiente"
    t.index ["email"], name: "index_restaurantes_on_email", unique: true
    t.index ["reset_password_token"], name: "index_restaurantes_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nombre"
    t.string "imagen"
    t.text "direccion"
    t.string "restaurantes_favoritos", array: true
    t.integer "registro_pedidos", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "rest_fav", default: [], array: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comentarios", "platos"
  add_foreign_key "comentarios", "restaurantes"
  add_foreign_key "comentarios", "users"
  add_foreign_key "orders", "restaurantes"
  add_foreign_key "orders", "users"
  add_foreign_key "platos", "orders"
  add_foreign_key "platos", "restaurantes"
end
