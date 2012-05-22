class ProtocolsController < ApplicationController
  def index
    @protocols = Protocol.all
  end

  def show
    @protocol = Protocol.find(params[:id])
  end
end
