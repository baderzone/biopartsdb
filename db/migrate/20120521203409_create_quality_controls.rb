class CreateQualityControls < ActiveRecord::Migration
  def change
    create_table :quality_controls do |t|

      t.string :process
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
