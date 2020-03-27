# frozen_string_literal: true

class CreateEnters < ActiveRecord::Migration[5.2]
  def change
    create_table :enters do |t|
      t.integer :user_id
      t.integer :group_id
      t.boolean :permission

      t.timestamps
    end
  end
end
