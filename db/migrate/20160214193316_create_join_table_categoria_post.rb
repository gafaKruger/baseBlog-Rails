class CreateJoinTableCategoriaPost < ActiveRecord::Migration
  def change
    create_join_table :categoria, :posts do |t|
      # t.index [:categorium_id, :post_id]
      # t.index [:post_id, :categorium_id]
    end
  end
end
