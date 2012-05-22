class FpcrProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :fpcr
  belongs_to :tpcr_product
  belongs_to :quality_control
  # attr_accessible :title, :body
end
