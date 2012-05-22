class CreateFpcrs < ActiveRecord::Migration
  def change
    create_table :fpcrs do |t|
      t.references :user
      t.references :status
      t.references :protocol
      t.references :device

      t.timestamps
    end
    add_index :fpcrs, :user_id
    add_index :fpcrs, :status_id
    add_index :fpcrs, :device_id
  end
end
