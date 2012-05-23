class CreatePcrGelImages < ActiveRecord::Migration
  def change
    create_table :pcr_gel_images do |t|
      t.references :pcr_gel
      t.string :pcr_gel_image_file
      t.timestamps
    end
    add_index :pcr_gel_images, :pcr_gel_id
  end
end
