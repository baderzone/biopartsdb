class AddNoteToCspcrGel < ActiveRecord::Migration
  def change
    add_column :cspcr_gels, :note, :text
  end
end
