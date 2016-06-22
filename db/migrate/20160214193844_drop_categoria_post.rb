class DropCategoriaPost < ActiveRecord::Migration
  def change
    drop_table :categoria_posts
  end
end
