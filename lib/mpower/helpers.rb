module Mpower::Helpers
  
  %w(content).each do |lib|
    autoload lib.capitalize, File.join(File.dirname(__FILE__), 'helpers', lib)
  end
  
end