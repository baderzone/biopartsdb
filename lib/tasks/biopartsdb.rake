require 'csv'
require 'gene_ontology'

namespace :biopartsdb do 
  desc 'Utility methods for DB maintance'
  
  namespace :parts do 
    
    desc 'Task for handling parts db load'
    
    task :import => :environment do
      filename = ENV['filename']
      puts "Loading parts from filename #{filename}"      

      CSV.foreach(filename) do |row|

        part = Part.new
        part.transaction do
          part.name = row[0]
          part.build_sequence(data: row[8])
          part.build_location(organism: Organism.find_by_latin(row[2]))
          part.feature = Feature.find_by_name(row[1])
          part.save!
          puts "#{part.name} loaded."
        end
        
      end 
    end    
  end
  
  namespace :oligoplates do
    desc 'Task for loading oligo plates inside the database'
    
    task :import => :environment do
      filename = ENV['filename']
      puts "Loading oligo plates from #{filename}"
      
      CSV.foreach(filename) do |row|
        oligo = Oligo.new
        
        oligo.transaction do
          oligo.name = row[1]
          oligo.part = Part.find_by_name(row[0])
          oligo.sequence = row[2]
          oligo.save!
          
          plate = OligoPlate.find_by_name(row[5]) || OligoPlate.new(name: row[5])
          plate.oligo_plate_wells.build(well: row[6], oligo: oligo)
          plate.save!
          puts "Loading oligo #{oligo.name} into well #{row[6]} of plate #{plate.name}"
        end
      end
    end
  end
  
  namespace :sofa do 
    desc 'Task for updating sequence ontology terms'
    
    task :import => :environment do
      filename = ENV['filename']
      
      go = GeneOntology.new.from_file(filename)
      go.id_to_term.values.each do |term|
        f = Feature.find_by_so(term.id) || Feature.new
        f.so = term.id
        f.name = term.name
        f.namespace = term.namespace
        f.definition = term.def
        f.save
      end
      
    end
  end
  
  namespace :account do
    desc 'Admin account creation'
    
    task :create_admin => :environment do
      email = ENV['email']
      fullname = ENV['fullname']
      
      user = User.new
      user.fullname = fullname
      user.email = email
      user.provider = "google"
      user.groups << Group.find_by_name(:admin)
      user.save
      
      puts "Admin user created for email: #{user.email}"
      
    end
    
  end
  
end