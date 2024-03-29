class CreateGroupMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :group_members do |t|
      t.integer :user_id, null: false
      t.integer :group_id, null: false
      t.integer :operation_right, null: false, default: 0
      t.timestamps
    end
  end
end
