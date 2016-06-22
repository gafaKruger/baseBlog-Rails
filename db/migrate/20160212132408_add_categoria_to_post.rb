class AddCategoriaToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :categoria, index: true, foreign_key: true
  end
end
