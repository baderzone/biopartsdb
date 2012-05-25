class CreateLigations < ActiveRecord::Migration
  def change
    create_table :ligations do |t|
      t.references :user
      t.references :status
      t.references :protocol
      
      t.timestamps
    end
    add_index :ligations, :user_id
    add_index :ligations, :status_id
    add_index :ligations, :protocol_id
  end
end
