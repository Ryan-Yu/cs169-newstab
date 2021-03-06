class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :subscriber_id
      t.integer :subscribed_id

      t.timestamps
    end
    
    add_index :subscriptions, :subscriber_id
    add_index :subscriptions, :subscribed_id
    # Ensures that a user can't subscribe to another user more than once
    add_index :subscriptions, [:subscriber_id, :subscribed_id], unique: true
  end
end
