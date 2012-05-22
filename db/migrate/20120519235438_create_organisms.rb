class CreateOrganisms < ActiveRecord::Migration
  def change
    create_table :organisms do |t|
      t.string :name
      t.string :latin
      t.string :gbtaxonid

      t.timestamps
    end
  end
end
