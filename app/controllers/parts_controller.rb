class PartsController < ApplicationController
  def index
    @parts = current_user.parts
  end

  def show
    @part = Part.find(params[:id])
    @sequence = Bio::Sequence::NA.new(@part.sequence.data)
  end
  
  def fasta
    part = Part.find(params[:id])
    sequence = Bio::Sequence::NA.new(part.sequence.data)
    seqid = "#{part.name} #{sequence.size}"
    filename = "#{part.name}.fasta"
    send_data sequence.to_fasta(seqid,80), :filename => filename, :type => 'chemical/seq-na-fasta FASTA', :disposition => 'attachment'
  end
  
end
