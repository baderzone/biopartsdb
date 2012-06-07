class ProtocolsController < ApplicationController
  def index
    @protocols = Protocol.all
  end

  def show
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
            :autolink => true, :space_after_headers => true)
    @protocol = Protocol.find(params[:id])
  end
end
