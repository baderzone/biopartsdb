class AddNoteToSpcr < ActiveRecord::Migration
  def change
    add_column :spcrs, :note, :text
  end
end
