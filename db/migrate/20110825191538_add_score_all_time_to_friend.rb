class AddScoreAllTimeToFriend < ActiveRecord::Migration
  def self.up
    add_column :friends, :score_alltime, :integer
  end

  def self.down
    remove_column :friends, :score_alltime
  end
end
