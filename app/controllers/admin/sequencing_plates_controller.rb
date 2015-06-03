class Admin::SequencingPlatesController < ApplicationController
  authorize_resource :class => :admin

  layout 'admin'
  require 'csv'

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

  def csv
  end

  def csv_create
    if params[:file].blank?
      return redirect_to '/admin/sequencing_plates/csv', :flash => {:error => "no file selected"}
    end
    
    uploader = QcUploader.new
    uploader.store!(params[:file])
    filename = uploader.current_path

    begin
      CSV.foreach(filename) do |row|
        plate = SequencingPlate.find_by_name(row[0])
        if plate.nil?
          return redirect_to '/admin/sequencing_plates/csv', :flash => {:error => "Plate #{row[0]} not found"}
        end
        well = SequencingPlateWell.find_by_sequencing_plate_id_and_well(plate.id, row[1])
        if well.nil?
          return redirect_to '/admin/sequencing_plates/csv', :flash => {:error => "Well #{row[1]} not found. The well name should be something like A01. A1 and A_01 are not valid"}
        end
        if well.sequencing_growth_plate_well.nil?
          return redirect_to '/admin/sequencing_plates/csv', :flash => {:error => "No clone found in Well #{row[1]}" }
        end
        qc = QualityControl.find_by_process_and_name('Sequencing', row[2])
        if qc.nil?
          return redirect_to '/admin/sequencing_plates/csv', :flash => {:error => "QC #{row[2]} is not valid. Only PASS, FAIL, CHECK, FIXABLE, MISLABELLED allowed"}
        end
        product_id = well.sequencing_growth_plate_well.sequencing_product_id
        product = SequencingProduct.find(product_id) 
        product.quality_control_id = qc.id
        product.save
      end
      redirect_to admin_parts_path, :notice => "Sequencing QC uploaded!"
    rescue => ex
      return redirect_to '/admin/sequencing_plates/csv', :flash => {:error => "Error while importing sequencing qc (#{ex.message})"}
    end
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
