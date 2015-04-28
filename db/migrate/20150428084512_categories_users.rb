class CategoriesUsers < ActiveRecord::Migration
  def change
    create_table :categories_users, id: false do |t|
      t.belongs_to :category, index: true
      t.belongs_to :user, index: true
    end
    add_index :categories_users, [:category_id, :user_id]
  end
end