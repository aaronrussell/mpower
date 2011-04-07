module Mpower
  
  VERSION = '0.0.0'
  
end

require File.join(File.dirname(__FILE__), 'mpower', 'core_ext')

# Load the core classes
%w(commands compiler config context exec filter).each do |lib|
  autoload lib.capitalize, File.join(File.dirname(__FILE__), 'mpower', lib)
end

# Load the execuatble commands
%w(build compile watch).each do |lib|
  autoload lib.capitalize, File.join(File.dirname(__FILE__), 'mpower', 'commands', lib)
end

# Load the built in helpers
%w(content).each do |lib|
  autoload lib.capitalize, File.join(File.dirname(__FILE__), 'mpower', 'helpers', lib)
end