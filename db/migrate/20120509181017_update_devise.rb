class UpdateDevise < ActiveRecord::Migration
  def up
    remove_column :users, :remember_token
    remove_column :admin_users, :remember_token    
  end

  def down
    add_column :users, :remember_token, :string
    add_column :admin_users, :remember_token, :string
  end
end
