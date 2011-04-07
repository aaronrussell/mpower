module Mpower
  
  VERSION = '0.0.0'
  
  %w(commands compiler config context exec filter helpers).each do |lib|
    autoload lib.capitalize, File.join(File.dirname(__FILE__), 'mpower', lib)
  end
  
end

require File.join(File.dirname(__FILE__), 'mpower', 'core_ext')