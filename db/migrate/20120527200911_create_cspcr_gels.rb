class CreateCspcrGels < ActiveRecord::Migration
  def change
    create_table :cspcr_gels do |t|
      t.references :user
      t.references :protocol
      t.references :status

      t.timestamps
    end
    add_index :cspcr_gels, :user_id
    add_index :cspcr_gels, :protocol_id
    add_index :cspcr_gels, :status_id
  end
end
