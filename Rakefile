#!/usr/bin/env rake

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

Bundler::GemHelper.install_tasks(name: 'dependy')

RSpec::Core::RakeTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

desc 'run specs'
task default: :spec
