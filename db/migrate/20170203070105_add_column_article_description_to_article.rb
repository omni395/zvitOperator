class AddColumnArticleDescriptionToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :article_description, :text
  end
end
