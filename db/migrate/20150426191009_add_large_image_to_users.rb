class AddLargeImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :large_image, :string
  end
end
