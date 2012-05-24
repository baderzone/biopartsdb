class RenameApcrToSpcr < ActiveRecord::Migration
  def change
      rename_table :apcrs, :spcrs
  end
end
