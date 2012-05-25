class CreateClones < ActiveRecord::Migration
  def change
    create_table :clones do |t|
      t.references :user
      t.references :transformation
      t.references :status
      t.references :quality_control
      t.references :protocol
      t.string :name
      t.string :color

      t.timestamps
    end
    add_index :clones, :user_id
    add_index :clones, :transformation_id
    add_index :clones, :status_id
    add_index :clones, :quality_control_id
    add_index :clones, :protocol_id
  end
end
