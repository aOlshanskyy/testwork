class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :evname
      t.integer :user_id
      t.integer :group_id
      t.datetime :day

      t.timestamps
    end
  end
end
