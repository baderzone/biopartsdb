class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :process
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
