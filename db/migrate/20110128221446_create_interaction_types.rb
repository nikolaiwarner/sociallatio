class CreateInteractionTypes < ActiveRecord::Migration
  def self.up
    create_table :interaction_types do |t|
      t.string :name
      t.integer :user_id
      t.integer :points

      t.timestamps
    end
  end

  def self.down
    drop_table :interaction_types
  end
end
