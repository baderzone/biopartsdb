class AddNoteToCspcr < ActiveRecord::Migration
  def change
    add_column :cspcrs, :note, :text
  end
end
