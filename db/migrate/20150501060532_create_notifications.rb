class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text         "body"
      t.integer      "user_id"
      t.boolean      "seen"
      t.string       "tunnel"
      
      t.timestamps
    end
  end
end
