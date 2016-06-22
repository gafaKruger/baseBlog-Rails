class AddPostToCategoria < ActiveRecord::Migration
  def change
    add_reference :categoria, :post, index: true, foreign_key: true
  end
end
