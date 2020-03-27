# frozen_string_literal: true

class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.string :name
      t.integer :group_id

      t.timestamps
    end
  end
end
