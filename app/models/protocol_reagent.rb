class ProtocolReagent < ActiveRecord::Base
  belongs_to :protocol
  
<<<<<<< HEAD
  attr_accessible :protocol_id, :final_concentration, :name, :stock_concentration, :volume_reaction
=======
  attr_accessible :final_concentration, :name, :stock_concentration, :volume_reaction, :protocol_id
>>>>>>> f864cee1ab08ca4db18db49659ae4a75be7a850a
end
