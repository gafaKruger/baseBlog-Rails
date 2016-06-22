class CreateComentarioAutenticados < ActiveRecord::Migration
  def change
    create_table :comentario_autenticados do |t|
      t.references :comentario, index: true, foreign_key: true
      t.references :usuario, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
