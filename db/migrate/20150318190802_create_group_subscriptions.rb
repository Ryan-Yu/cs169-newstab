class CreateGroupSubscriptions < ActiveRecord::Migration
  def change
    create_table :group_subscriptions do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
