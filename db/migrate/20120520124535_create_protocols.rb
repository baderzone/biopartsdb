class CreateProtocols < ActiveRecord::Migration
  def change
    create_table :protocols do |t|
      t.string :process
      t.string :name
      t.text :content
      t.references :user

      t.timestamps
    end
    add_index :protocols, :user_id
  end
end
