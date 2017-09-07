class AddUseridToMurals < ActiveRecord::Migration[5.0]
  def change
    add_column :murals, :user_id, :integer, null: false
  end
end
