class CreateCspcrGelImages < ActiveRecord::Migration
  def change
    create_table :cspcr_gel_images do |t|
      t.references :cspcr_gel
      t.string :cspcr_gel_image_file
      t.timestamps
    end
    add_index :cspcr_gel_images, :cspcr_gel_id
  end
end
