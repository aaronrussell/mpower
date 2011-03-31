module Mpower::Commands
  
  class Base
    
    attr_reader :project_path, :project_name, :config_file, :config
    
    def initialize(path)
      @project_path = path
      @project_name = File.basename(path)
      @config_file  = File.join(path, 'config.yml')
      @config       = Mpower::Config.new(path)
      run
    end
    
    def source_path
      config.source_path
    end
    
    def output_path
      config.output_path
    end
    
    def assets_path
      config.assets_path
    end
    
    def compiler
      @compiler ||= Mpower::Compiler.new(config)
    end
    
  end
  
end

%w(build compile watch).each do |lib|
  require File.join(File.dirname(__FILE__), 'commands', lib)
end