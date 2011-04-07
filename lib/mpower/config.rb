module Mpower
  
  class Config
    
    attr_reader :project_path, :project_name, :mpower, :premailer, :html_tidy
    
    def initialize(path)
      config_file = File.join(path, 'config.yml')
      yaml = File.exist?(config_file) ? YAML::load(File.open(config_file)) : {}
      @project_path = path
      @project_name = File.basename(path)
      %w{mpower premailer html_tidy}.each do |dep|
        merge_options(dep, yaml)
      end
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
    
    def use_html_tidy?
      mpower[:use_html_tidy]
    end
    
    private
    
    def merge_options(dep, yaml)
      instance_variable_set("@#{dep}", yaml[dep] ?
        send("#{dep}_defaults".to_sym).merge!(yaml[dep].symbolize_keys) :
        send("#{dep}_defaults".to_sym)
      )
    end
    
    def mpower_defaults
      {
        :source_path    => 'source',
        :output_path    => 'output',
        :assets_path    => 'images',
        :use_html_tidy  => true
      }
    end
    
    def premailer_defaults
      {}
    end
    
    def html_tidy_defaults
      {
        :indent         => 1,
        :tidy_mark      => 0,
        :char_encoding  => 'latin1'
      }
    end
    
  end
  
end