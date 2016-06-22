class AddAdmToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :adm, :boolean
  end
end
