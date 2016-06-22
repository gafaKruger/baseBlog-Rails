class RemoveCategoriaFromPost < ActiveRecord::Migration
  def change
    remove_reference :posts, :categoria, index: true, foreign_key: true
  end
end
