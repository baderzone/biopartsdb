class CreateSequencingGrowthPlates < ActiveRecord::Migration
  def change
    create_table :sequencing_growth_plates do |t|
      t.references :user
      t.string :name

      t.timestamps
    end
    add_index :sequencing_growth_plates, :user_id
  end
end
