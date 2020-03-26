class AddContextToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :context, :string
  end
end
