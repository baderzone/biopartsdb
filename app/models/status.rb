class Status < ActiveRecord::Base
  attr_accessible :class, :description, :process, :name, :default

  def to_s
    name
  end

end
