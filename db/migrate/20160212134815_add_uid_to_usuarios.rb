class AddUidToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :uid, :string
  end
end
