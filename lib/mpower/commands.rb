module Mpower::Commands
  
  %w(base build compile watch).each do |lib|
    autoload lib.capitalize, File.join(File.dirname(__FILE__), 'commands', lib)
  end
  
end