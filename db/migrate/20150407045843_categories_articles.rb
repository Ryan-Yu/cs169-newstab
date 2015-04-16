class CategoriesArticles < ActiveRecord::Migration
  def change
    create_table :articles_categories, id: false do |t|
      t.belongs_to :category, index: true
      t.belongs_to :article, index: true
    end
    add_index :articles_categories, [:category_id, :article_id]
  end
end
