class RemovePostFromCategoria < ActiveRecord::Migration
  def change
    remove_reference :categoria, :post, index: true, foreign_key: true
  end
end
