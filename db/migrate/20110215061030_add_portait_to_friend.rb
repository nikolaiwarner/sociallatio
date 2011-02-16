class AddPortaitToFriend < ActiveRecord::Migration
  def self.up
    add_column :friends, :portrait, :string
  end

  def self.down
    remove_column :friends, :portrait
  end
end
