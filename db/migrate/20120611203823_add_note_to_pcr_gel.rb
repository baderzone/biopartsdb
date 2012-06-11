class AddNoteToPcrGel < ActiveRecord::Migration
  def change
    add_column :pcr_gels, :note, :text
  end
end
