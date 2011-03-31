require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "mpower"
  gem.homepage = "http://github.com/aaronrussell/mpower"
  gem.license = "MIT"
  gem.summary = "mpower is a small HTML email generation framework"
  gem.description = "mpower is a small HTML email generation framework"
  gem.email = "aaron@gc4.co.uk"
  gem.authors = ["Aaron Russell"]
  gem.files = Dir.glob('lib/**/*.rb')
  gem.executables = ["shemail"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  gem.add_runtime_dependency 'premailer'
  gem.add_runtime_dependency 'slop'
  gem.add_runtime_dependency 'erubis'
  gem.add_runtime_dependency 'fssm'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new