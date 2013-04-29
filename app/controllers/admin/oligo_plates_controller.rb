class Admin::OligoPlatesController < ApplicationController
  authorize_resource :class => :admin

  layout 'admin'
  require 'csv'

  def index
    @plates = OligoPlate.paginate(:page => params[:page], :per_page => 10).order('id')
  end

  def show
    @plate = OligoPlate.find(params[:id])
  end
  def new 
    @plate = OligoPlate.new
  end

  def create
    @plate = OligoPlate.new
    uploader = OligoPlatesUploader.new
    uploader.store!(params[:oligo_plate][:file])
    filename = uploader.current_path

    begin
      @plate = OligoPlate.new

      CSV.foreach(filename) do |row|
        if Part.find_by_name(row[2]).nil?
          flash[:error] = "Part '#{row[2]}' not found.  Please make sure the part name is correct"
          return render :new
        end
      end

      CSV.foreach(filename) do |row|
        oligo = Oligo.find_by_name_and_part_id(row[3], Part.find_by_name(row[2]).id)

        ActiveRecord::Base.transaction do
          if oligo.nil?
            oligo = Oligo.new
            oligo.name = row[3]
            oligo.part = Part.find_by_name(row[2])
            oligo.sequence = row[4]
            oligo.save!
          end

          plate = OligoPlate.find_by_name(row[0]) || OligoPlate.new(name: row[0])
          plate.oligo_plate_wells.build(well: row[1], oligo: oligo)
          plate.save!
        end
      end
      redirect_to admin_oligo_plates_path, :notice => "Oligo Plates uploaded!"
    rescue => ex
      flash[:error] = "Error while importing oligo plates (#{ex.message})"
      render :new
    end
  end

  end
