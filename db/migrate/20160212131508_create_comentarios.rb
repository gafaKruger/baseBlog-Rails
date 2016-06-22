class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.string :autor
      t.text :corpo
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
