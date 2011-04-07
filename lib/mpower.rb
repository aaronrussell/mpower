module Mpower
  
  VERSION = '0.0.0'
  
end

require 'rubygems'

%w(compiler config context core_ext exec filter).each do |lib|
  require File.join(File.dirname(__FILE__), 'mpower', lib)
end