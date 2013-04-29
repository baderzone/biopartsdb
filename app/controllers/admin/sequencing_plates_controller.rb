class Admin::SequencingPlatesController < ApplicationController
  authorize_resource :class => :admin

  layout 'admin'

  def index
    @sequencing_plates = SequencingPlate.paginate(:page => params[:page], :per_page => 10).order('id DESC')
  end

  def show
    @sequencing_plate = SequencingPlate.find(params[:id])
  end

  def new
    @sequencing_plate = SequencingPlate.new
  end

  def create
    @sequencing_plate = SequencingPlate.new(params[:sequencing_plate])

    begin
      @sequencing_plate.transaction do
        @sequencing_plate.status = Status.find_by_process_and_default(:sequencing,true)
        @sequencing_plate.save!
        @sequencing_plate.name += "_#{@sequencing_plate.id}"
        @sequencing_plate.save!

        wells = create_wells
        wells.each do |well|
          SequencingPlateWell.create(sequencing_plate: @sequencing_plate, well: well)
        end

      end
      redirect_to admin_sequencing_plate_path(@sequencing_plate), :notice => "Sequencing plate created correctly."
    rescue => ex
      flash[:error] = "Error while creating sequencing plate. #{ex.message}"
      render :new 
    end

  end

  def edit
    @sequencing_plate = SequencingPlate.find(params[:id])
    @statuses = Status.find_all_by_process(:sequencing)
  end

  def update
    @sequencing_plate = SequencingPlate.find(params[:id])

    if @sequencing_plate.update_attributes(params[:sequencing_plate])
      redirect_to admin_sequencing_plate_path(@sequencing_plate), :notice => "Sequencing plate updated correctly."
    else
      render :edit
    end

  end

  def fasta
    sequencing_plate = SequencingPlate.find(params[:id])
    data = ""
    sequencing_plate.parts.each do |part|
      sequence = Bio::Sequence::NA.new(part.sequence.data)
      seqid = "#{part.name}-#{sequencing_plate.name}"
      data += sequence.to_fasta(seqid,80)
    end
    filename = "#{sequencing_plate.name}.fasta"
    send_data data, :filename => filename, :type => 'chemical/seq-na-fasta FASTA', :disposition => 'attachment'
  end

  private

  def create_wells
    wells = []
    ('A'..'H').each do |row|
      ('01'..'12').each do |col|
        wells.push(row+col)
      end
    end  
    return wells
  end 

end
