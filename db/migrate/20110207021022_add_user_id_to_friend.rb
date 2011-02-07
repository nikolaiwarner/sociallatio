class AddUserIdToFriend < ActiveRecord::Migration
  def self.up
    add_column :friends, :user_id, :integer
  end

  def self.down
    remove_column :friends, :user_id
  end
end
