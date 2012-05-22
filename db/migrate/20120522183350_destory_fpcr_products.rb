class DestoryFpcrProducts < ActiveRecord::Migration
  def change
    drop_table :fpcr_products
  end
end
