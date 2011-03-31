module Mpower
  
  class Config
    
    attr_reader :project_path, :project_name, :mpower, :premailer
    
    def initialize(path)
      config_file = File.join(path, 'config.yml')
      yaml = File.exist?(config_file) ? YAML::load(File.open(config_file)) : {}
      @project_path = path
      @project_name = File.basename(path)
      @mpower       = yaml['mpower'].symbolize_keys
      @premailer    = yaml['premailer'].symbolize_keys
    end
        
    def source_path
      @source_path ||= File.join(project_path, mpower[:source_path])
    end
    
    def output_path
      @output_path ||= File.join(project_path, mpower[:output_path])
    end
    
  end
  
end