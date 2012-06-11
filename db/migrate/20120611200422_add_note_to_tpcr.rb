class AddNoteToTpcr < ActiveRecord::Migration
  def change
    add_column :tpcrs, :note, :text
  end
end
