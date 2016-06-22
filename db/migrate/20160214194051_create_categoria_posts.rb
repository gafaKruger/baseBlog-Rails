class CreateCategoriaPosts < ActiveRecord::Migration
  def change
    create_table :categoria_posts do |t|
      t.references :categoria, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
