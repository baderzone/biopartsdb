class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user
      t.references :part

      t.timestamps
    end
    add_index :tasks, :user_id
    add_index :tasks, :part_id
  end
end
