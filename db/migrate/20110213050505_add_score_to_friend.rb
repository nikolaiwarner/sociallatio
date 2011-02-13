class AddScoreToFriend < ActiveRecord::Migration
  def self.up
    add_column :friends, :score, :integer
  end

  def self.down
    remove_column :friends, :score
  end
end
