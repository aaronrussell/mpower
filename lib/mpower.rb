module Mpower
  
  VERSION = '0.0.0'
  
end

%w(commands compiler config context core_ext exec filter helpers).each do |lib|
  require File.join(File.dirname(__FILE__), 'mpower', lib)
end