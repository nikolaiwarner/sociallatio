class AddUserIdToFrequency < ActiveRecord::Migration
  def self.up
    add_column :frequencies, :user_id, :integer
  end

  def self.down
    remove_column :frequencies, :user_id
  end
end
