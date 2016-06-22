class AddProviderToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :provider, :string
  end
end
