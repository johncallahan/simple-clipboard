# coding: utf-8
# frozen_string_literal: false

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'rake/extensiontask'

desc "simple_clipboard test suite"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = "spec/*_spec.rb"
  t.verbose = true
end

Rake::ExtensionTask.new do |ext|
  ext.name = 'simple_clipboard'
  ext.source_pattern = "*.{c,h}"
  ext.ext_dir = 'ext/simple_clipboard'
  ext.lib_dir = 'lib/simple_clipboard'
  ext.gem_spec =
    Gem::Specification.load('simple_clipboard.gemspec')
end

task :default => [:compile, :spec]
