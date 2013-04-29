class CreatePcrGelImageAnnotations < ActiveRecord::Migration
  def change
    create_table :pcr_gel_image_annotations do |t|
      t.integer :pcr_gel_image_id
      t.string :label
      t.string :position

      t.timestamps
    end
  end
end
