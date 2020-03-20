class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :user_id
      t.string :body
      t.integer :group_id

      t.timestamps
    end
  end
end
