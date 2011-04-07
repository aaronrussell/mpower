module Mpower::Commands
  
  class Build < Mpower::Commands::Base
    
    DEFAULT_CONFIG = <<EOS
# mpower configuration file

# mpower config options
mpower:
  source_path:    "source"
  output_path:    "output"
  assets_path:    "images"
  use_tidy_html:  true

# Premailer config options
premailer:
  # base_url:       "http://google.com/"

# HTML Tidy options
html_tidy:
  char_encoding:  "latin1"

EOS
    
    DEFAULT_HTML = <<EOS
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-type" content="text/html; charset=iso-8859-1">
  <title>{{project_name}}.html</title>
  <style type="text/css" media="screen">
    body { margin:0; padding:0; }
    img { display:block; }
    a img { border:none; }
  </style>
</head>
<body>
  
</body>
</html>
EOS
    
    def run
      create_project_directory
      create_project_structure
      create_config_file
      create_html_file
    end
    
    def html_file
      @html_file ||= File.join(source_path, "#{project_name}.html")
    end
    
    private
    
    def create_project_directory
      if File.exist? project_path
        puts "Path '#{project_path}' already exists..."
      else
        puts "Creating project directory '#{project_path}'..."
        FileUtils.mkdir_p project_path
      end
    end
    
    def create_project_structure
      [source_path, assets_path, output_path].each do |path|
        FileUtils.mkdir_p(path) unless File.exist?(path)
      end
    end
    
    def create_config_file
      if File.exist? config_file
        puts "Config file already exists..."
      else
        puts "Creating project config file..."
        File.open(config_file, 'w') {|io| io.write(DEFAULT_CONFIG) }
      end
    end
    
    def create_html_file
      if File.exist? html_file
        puts "Default HTML file already exists..."
      else
        puts "Creating default HTML file..."
        File.open(html_file, 'w') { |io| io.write(DEFAULT_HTML.gsub('{{project_name}}', project_name)) }
      end
    end
    
  end
  
end