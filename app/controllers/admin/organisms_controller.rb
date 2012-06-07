class Admin::OrganismsController < ApplicationController
  authorize_resource :class => :admin
  
  layout 'admin'
  
  def index
    @organisms = Organism.all
  end

  def show
    @organism = Organism.find(params[:id])
  end

  def new
    @organism = Organism.new
  end
  
  def create
    @organism = Organism.new(params[:organism])
    
    if @organism.save
      redirect_to admin_organism_path(@organism), :notice => "Organism created correctly."
    else
      flash[:error] = "Error you forget something: " + get_model_error_message(@organism)
      render :new
    end
  end

  def edit
    @organism = Organism.find(params[:id])
  end
  
  def update
    @organism = Organism.find(params[:id])
    
    @organism.update_attributes(params[:organism])
    
    if @organism.save
      redirect_to admin_organisms_path, :notice => "Organism updated correctly."
    else
      flash[:error] = "Error you forget something: " + get_model_error_message(@organism)
      render :edit
    end
  end
end
