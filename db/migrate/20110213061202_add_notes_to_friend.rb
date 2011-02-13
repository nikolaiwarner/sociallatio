class AddNotesToFriend < ActiveRecord::Migration
  def self.up
    add_column :friends, :notes, :text
  end

  def self.down
    remove_column :friends, :notes
  end
end
