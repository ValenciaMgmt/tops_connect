APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
$LOAD_PATH << File.join(APP_ROOT, 'lib')

require 'rspec/core/rake_task'
require './lib/tops_connect'

RSpec::Core::RakeTask.new(:spec)

task default: :spec
