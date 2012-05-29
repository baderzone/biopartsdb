class ProtocolReagent < ActiveRecord::Base
  belongs_to :protocol
  
  attr_accessible :protocol_id, :final_concentration, :name, :stock_concentration, :volume_reaction
  

end
