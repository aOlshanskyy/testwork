class CreateArticlescoments < ActiveRecord::Migration[5.1]
  def change
    create_table :articlescoments do |t|
      t.string :textofcom
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
  end
end
