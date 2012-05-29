class SequencingProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :sequencing
  belongs_to :part
  belongs_to :clone
  belongs_to :quality_control
  # attr_accessible :title, :body
end
