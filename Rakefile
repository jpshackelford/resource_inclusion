require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require File.join(File.dirname(__FILE__), 'lib', 'resource_inclusion', 'version')

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "resource_inclusion"
    s.version = ResourceInclusion::VERSION.dup
    #   s.rubyforge_project = "resource_inclusion"
    s.summary = "A handy macro for including associated models in your REST APIs."
    s.email = "jpshack@gmail.com"
    s.homepage = "http://github.com/jpshackelford/resource_inclusion"
    s.description = "Resource Inclusion allows one to specify once per controller associated resources to be included when a resource is serialized."
    s.authors = ['John-Mason P. Shackelford']
    s.files =  FileList["*", "{lib}/**/*", "{test}/**/*"]
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

AppDir = File.join(File.dirname(__FILE__), 'test', 'app')

desc 'Run tests for InheritedResources.'
task :test do
  Dir.chdir( AppDir ) do
    sh %{ bundle exec rake  }
  end
end

task :default => :test

desc 'Generate documentation for InheritedResources.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ResourceInclusion'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('MIT-LICENSE')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
