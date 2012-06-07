class Admin::ProtocolsController < ApplicationController
  authorize_resource :class => :admin
  
  layout 'admin'
  
  
  def index
    @protocols = Protocol.all
  end

  def show
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
            :autolink => true, :space_after_headers => true)
    @protocol = Protocol.find(params[:id])
  end

  def new
  end

  def edit
    @protocol = Protocol.find(params[:id])
  end
  
  def update
    @protocol = Protocol.find(params[:id])
    
    @protocol.update_attributes(params[:protocol])
    @protocol.user = current_user
    
    
    if @protocol.save
      redirect_to admin_protocols_path, :notice => "Protocol updated correctly."
    else
      flash[:error] = "Error you forget something: " + get_model_error_message(@protocol)
      render :edit
    end
  end
end
