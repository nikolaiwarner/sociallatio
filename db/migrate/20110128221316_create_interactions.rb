class CreateInteractions < ActiveRecord::Migration
  def self.up
    create_table :interactions do |t|
      t.integer :friend_id
      t.integer :user_id
      t.datetime :datetime
      t.text :description
      t.integer :interaction_type_id
      t.integer :points

      t.timestamps
    end
  end

  def self.down
    drop_table :interactions
  end
end
