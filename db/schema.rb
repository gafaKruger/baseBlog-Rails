# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160214194051) do

  create_table "categoria", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "post_id"
  end

  add_index "categoria", ["post_id"], name: "index_categoria_on_post_id"

  create_table "categoria_posts", force: :cascade do |t|
    t.integer  "categoria_id"
    t.integer  "post_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "categoria_posts", ["categoria_id"], name: "index_categoria_posts_on_categoria_id"
  add_index "categoria_posts", ["post_id"], name: "index_categoria_posts_on_post_id"

  create_table "comentario_autenticados", force: :cascade do |t|
    t.integer  "comentario_id"
    t.integer  "usuario_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "comentario_autenticados", ["comentario_id"], name: "index_comentario_autenticados_on_comentario_id"
  add_index "comentario_autenticados", ["usuario_id"], name: "index_comentario_autenticados_on_usuario_id"

  create_table "comentarios", force: :cascade do |t|
    t.string   "autor"
    t.text     "corpo"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comentarios", ["post_id"], name: "index_comentarios_on_post_id"

  create_table "posts", force: :cascade do |t|
    t.string   "titulo"
    t.string   "autor"
    t.text     "corpo"
    t.integer  "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posts", ["usuario_id"], name: "index_posts_on_usuario_id"

  create_table "usuarios", force: :cascade do |t|
    t.string   "nome_completo"
    t.string   "apelido"
    t.string   "sexo"
    t.string   "email"
    t.date     "data_cadastro"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.boolean  "adm"
    t.string   "access_token"
    t.string   "secret"
    t.string   "uid"
  end

end
