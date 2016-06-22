class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nome_completo
      t.string :apelido
      t.string :sexo
      t.string :email
      t.date :data_cadastro

      t.timestamps null: false
    end
  end
end
