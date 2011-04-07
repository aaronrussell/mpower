module Mpower
  
  class Context
    
    include Mpower::Helpers::Content
    
    def initialize(hash = {})
      metaclass = (class << self ; self ; end)
      hash.each_pair do |key, value|
        # Build instance variable
        instance_variable_set('@' + key.to_s, value)
        # Define method
        metaclass.send(:define_method, key) { value }
      end
    end
    
    def get_binding
      binding
    end
    
  end
  
end