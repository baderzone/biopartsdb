class AddNoteToTransformation < ActiveRecord::Migration
  def change
    add_column :transformations, :note, :text
  end
end
