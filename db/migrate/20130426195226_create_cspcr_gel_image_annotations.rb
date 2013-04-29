class CreateCspcrGelImageAnnotations < ActiveRecord::Migration
  def change
    create_table :cspcr_gel_image_annotations do |t|
      t.integer :cspcr_gel_image_id
      t.string :label
      t.string :position

      t.timestamps
    end
  end
end
