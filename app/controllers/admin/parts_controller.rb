class Admin::PartsController < ApplicationController
  authorize_resource :class => :admin

  layout 'admin'
  require 'csv'

  def index
    @parts = Part.paginate(:page => params[:page], :per_page => 10).order('name')
  end

  def new 
    @part = Part.new
  end

  def create
    @part = Part.new
    uploader = PartsUploader.new
    uploader.store!(params[:part][:parts_file])
    filename = uploader.current_path

    begin
      CSV.foreach(filename) do |row|
        if Feature.find_by_name(row[1]).nil? 
          flash[:error] = "Feature '#{row[1]}' not found. Please make sure the name of the feature is correct"
          return render :new
        end
        if Organism.find_by_latin(row[2]).nil?
          flash[:error] = "Organism '#{row[2]}' not found.  Please make sure the latin name of the organism is correct"
          return render :new
        end
      end
      CSV.foreach(filename) do |row|
        @part = Part.new
        @part.transaction do
          @part.name = row[0]
          @part.feature = Feature.find_by_name(row[1])
          @part.build_sequence(data: row[-1])
          @part.build_location(organism: Organism.find_by_latin(row[2]), chromosome: row[3], start: row[4], stop: row[5], strand: row[6]) 
          @part.save!
        end  
      end
      redirect_to admin_parts_path, :notice => "Parts uploaded!"
    rescue => ex
      flash[:error] = "Error while importing parts (#{ex.message})"
      render :new
    end

  end
end
