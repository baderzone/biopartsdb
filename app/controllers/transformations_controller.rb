class TransformationsController < ApplicationController
  def index
    @transformations = current_user.transformations.reaction_pass.order("id DESC")
  end

  def show
    @transformation = Transformation.find(params[:id])
  end

  def new
    @transformation = Transformation.new
  end
  
  def create
    @transformation = Transformation.new(params[:transformation])
    @transformation.user = current_user
    @transformation.status = Status.find_by_process_and_default(Transformation.to_s, true)
    @transformation.protocol = Protocol.find_by_process(Transformation.to_s)
    @transformation.white_count = 0
    @transformation.blue_count = 0
    @transformation.light_blue_count = 0
    
    if @transformation.save      
      redirect_to transformation_path(@transformation), :notice => "Transformation created correctly."
    else
      flash[:error] = "Error you forget something: " + get_model_error_message(@transformation)
      render :new
    end
  end

  def edit
    @transformation = Transformation.find(params[:id])
    @quality_controls = QualityControl.find_all_by_process(Transformation.to_s)
    @statuses = Status.find_all_by_process(Transformation.to_s)
  end
  
  def update
    @transformation = Transformation.find(params[:id])
    if @transformation.update_attributes(params[:transformation])
      redirect_to transformation_path(@transformation), :notice => "Transformation updated correctly."
    else
      render :edit
    end
  end
  
  
end
