class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :so
      t.string :name
      t.string :namespace
      t.text :definition

      t.timestamps
    end
  end
end
