class CreateGroupsUsers < ActiveRecord::Migration
  def change
    create_table :groups_users do |t|
      t.references :user
      t.references :group

      t.timestamps
    end
    add_index :groups_users, :user_id
    add_index :groups_users, :group_id
  end
end
