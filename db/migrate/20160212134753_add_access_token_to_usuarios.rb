class AddAccessTokenToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :access_token, :string
  end
end
