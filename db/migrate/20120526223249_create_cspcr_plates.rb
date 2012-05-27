class CreateCspcrPlates < ActiveRecord::Migration
  def change
    create_table :cspcr_plates do |t|
      t.references :user
      t.references :cspcr
      t.string :name

      t.timestamps
    end
    add_index :cspcr_plates, :user_id
    add_index :cspcr_plates, :cspcr_id
  end
end
