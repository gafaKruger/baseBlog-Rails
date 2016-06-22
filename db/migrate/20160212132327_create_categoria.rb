class CreateCategoria < ActiveRecord::Migration
  def change
    create_table :categoria do |t|
      t.string :nome
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
