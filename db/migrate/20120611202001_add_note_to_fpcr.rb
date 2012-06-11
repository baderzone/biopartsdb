class AddNoteToFpcr < ActiveRecord::Migration
  def change
    add_column :fpcrs, :note, :text
  end
end
