class QualityControl < ActiveRecord::Base
  attr_accessible :process, :description, :name
  
  def to_s
    name
  end
  
end
