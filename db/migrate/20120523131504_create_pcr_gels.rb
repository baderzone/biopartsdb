class CreatePcrGels < ActiveRecord::Migration
  def change
    create_table :pcr_gels do |t|
      t.references :user
      t.references :protocol
      t.references :status

      t.timestamps
    end
    add_index :pcr_gels, :user_id
    add_index :pcr_gels, :protocol_id
    add_index :pcr_gels, :status_id
  end
end
