class AddSecretToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :secret, :string
  end
end
