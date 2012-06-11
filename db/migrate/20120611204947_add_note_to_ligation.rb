class AddNoteToLigation < ActiveRecord::Migration
  def change
    add_column :ligations, :note, :text
  end
end
