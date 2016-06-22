class RemoveProviderFromUsuarios < ActiveRecord::Migration
  def change
    remove_column :usuarios, :provider, :string
  end
end
