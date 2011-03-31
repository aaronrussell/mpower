require 'premailer'

module Mpower
  
  class Compiler
    
    attr_reader :config
    
    def initialize(config)
      @config = config
    end
    
    def source_html
      Dir.glob File.join(config.source_path, '[^_]*.html')
    end
    
    def source_css
      Dir.glob File.join(config.source_path, '[^_]*.css')
    end
    
    def source_files
      source_html + source_css
    end
    
    def output_files
      source_files.map { |src| output_for(src) }
    end
    
    def assets_files
      Dir.glob File.join(config.assets_path, '*')
    end
    
    def output_for(src)
      File.join(config.output_path, File.basename(src))
    end
    
    def asset_ouput(src)
      File.join(config.output_path, File.basename(config.assets_path), File.basename(src))
    end
    
    def text_output_for(src)
      return false unless src =~ /.html$/i
      output_for(src).gsub(/.html$/i, '.txt')
    end
    
    def compile!
      FileUtils.cd config.source_path
      # TODO - make more efficient by checking mtimes
      FileUtils.cp_r(config.assets_path, output_for(config.assets_path))
      source_html.each do |src|
        input   = File.open(src, 'r') { |f| f.read }
        premailer = Premailer.new(Mpower::Filter.new(input).run, config.premailer.merge(:with_html_string => true))
        File.open(output_for(src), 'w') do |out|
          out.write premailer.to_inline_css
        end
        File.open(text_output_for(src), 'w') do |out|
          out.write premailer.to_plain_text
        end
      end
    end
    
  end
  
end