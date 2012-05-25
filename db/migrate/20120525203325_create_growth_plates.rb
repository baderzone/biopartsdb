class CreateGrowthPlates < ActiveRecord::Migration
  def change
    create_table :growth_plates do |t|
      t.references :user
      t.string :name

      t.timestamps
    end
    add_index :growth_plates, :user_id
  end
end
