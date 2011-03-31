module Mpower::Commands
  
  class Compile < Mpower::Commands::Base
    
    def run
      puts "mpower compiling '#{source_path}'..."
      compiler.compile!
    end
        
  end
  
end
