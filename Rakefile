require 'bundler'
Bundler::GemHelper.install_tasks

task :test do
  $: << 'lib'

  SMARTFILE_CONFIG ||= {}
  SMARTFILE_CONFIG['key'] ||= 'key'
  SMARTFILE_CONFIG['pass'] ||= 'pass'
  require 'minitest/autorun'
  require 'webmock/minitest'
  require 'smartfile'
  Dir['./test/**/test_*.rb'].each { |test| require test }
end

task :default => :test