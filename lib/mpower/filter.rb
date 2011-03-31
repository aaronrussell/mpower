require 'erubis'

module Mpower
  
  class Filter
    
    def initialize(input)
      @content = input
    end
    
    def run(params = {})
      capture = params.delete('captured_content')
      context = Mpower::Context.new(params)
      erb     = Erubis::Eruby.new(@content)
      erb.result(context.get_binding { capture })
    end
    
  end
  
end