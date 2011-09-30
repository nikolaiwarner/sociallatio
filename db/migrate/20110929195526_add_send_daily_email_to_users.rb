class AddSendDailyEmailToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :send_daily_email, :boolean, :default => true
  end

  def self.down
    remove_column :users, :send_daily_email
  end
end
