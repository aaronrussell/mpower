require 'fssm'

module Mpower::Commands
  
  class Watch < Mpower::Commands::Base
    
    def run
      puts "Watching for changes in '#{source_path}'..."
      FSSM.monitor(source_path) do |path|
        path.glob '**/*.*'
        path.create &method(:compile)
        path.update &method(:compile)
  #     path.delete {|base, relative| remove_obsolete_css(base,relative); recompile(base, relative)}
      end
    end
    
    def compile(base, relative)
      puts "Change detected to '#{relative}'..."
      compiler.compile!
    end
    
  end
  
end