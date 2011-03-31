module Mpower::Helpers
  
  module Content
    
    CAPTURES = {}
        
    def render(path, params = {})
      file_name = File.basename(path)
      input = File.open(path.gsub(%r{#{file_name}$}, "_#{file_name}.html")) { |f| f.read }
      Mpower::Filter.new(input).run(params)
    end
    
    def wrap(path, params = {}, &block)
      params['captured_content'] = capture(&block) if block_given?
      result = render(path, params)
      buf = eval('_buf', block.binding)
      buf << result
      result
    end
    
    def content_for(name, &block)
      if block_given? # Set content
        CAPTURES[name.to_sym] = capture(&block)
      else # Get content
        CAPTURES[name.to_sym]
      end
    end
    
    private
    
    def capture(&block)
      # Get erbout so far
      buf = eval('_buf', block.binding)
      buf_length = buf.length
      # Execute block
      block.call
      # Get new piece of erbout
      buf_addition = buf[buf_length..-1]
      # Remove addition
      buf[buf_length..-1] = ''
      # Done
      buf_addition
    end
    
  end
  
end