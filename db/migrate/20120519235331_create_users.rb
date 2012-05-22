class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :fullname
      t.string :email
      t.string :provider

      t.timestamps
    end
  end
end
