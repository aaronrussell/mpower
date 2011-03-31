module Mpower
  
  class Config
    
    attr_reader :project_path, :project_name, :mpower, :premailer
    
    def initialize(path)
      config_file = File.join(path, 'config.yml')
      yaml = File.exist?(config_file) ? YAML::load(File.open(config_file)) : {}
      @project_path = path
      @project_name = File.basename(path)
      @mpower       = yaml['mpower']    ? yaml['mpower'].symbolize_keys     : mpower_defaults
      @premailer    = yaml['premailer'] ? yaml['premailer'].symbolize_keys  : premailer_deaults
    end
        
    def source_path
      @source_path ||= File.join(project_path, mpower[:source_path])
    end
    
    def output_path
      @output_path ||= File.join(project_path, mpower[:output_path])
    end
    
    def assets_path
      @asset_path ||= File.join(source_path, mpower[:assets_path])
    end
    
    private
    
    def mpower_defaults
      {
        :source_path => 'source',
        :output_path => 'output',
        :assets_path => 'images'
      }
    end
    
    def premailer_deaults
      {}
    end
    
  end
  
end