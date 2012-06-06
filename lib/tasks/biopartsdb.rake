namespace :biopartsdb do 
  desc 'Utility methods for DB maintance'
  
  namespace :parts do 
    
    desc 'Task for handling parts db load'
    
    task :load => :environment do
      filename = ENV['filename']
    
      puts "Loading filename #{filename}"
    
    end
  end
  
end