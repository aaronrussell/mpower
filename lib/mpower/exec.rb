require 'slop'

module Mpower
  
  class Exec
   
    def initialize
      @opts = Slop.parse(ARGV[0] || ARGV) do
        banner "Usage: mpower [command] <project path>"
        on :n, :new,      "Create a new mpower project"
        on :c, :compile,  "Compile the mpower project"
        on :w, :watch,    "Compile mpower as changes are made"
        on :h, :help,     "Display mpower help" do
          puts help
        end
        on :v, :version,  "Display mpower version" do
          puts "mpower version: #{Mpower::VERSION}"
        end
      end
      run_command
    end
            
    def run_command
      if @opts.to_hash.values.grep(true).size == 1
        Mpower::Commands::Build.new project_path    if @opts.new?
        Mpower::Commands::Compile.new project_path  if @opts.compile?
        Mpower::Commands::Watch.new project_path    if @opts.watch?
      else
        puts "*** INVALID COMMAND ***"
        puts @opts.help
      end
    end
    
    def project_path
      ARGV[1] || Dir.pwd
    end
        
  end
  
end