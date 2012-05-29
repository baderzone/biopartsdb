class Sequencing < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  belongs_to :sequencing_growth_plate
  # attr_accessible :title, :body
end
