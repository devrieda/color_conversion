#!/usr/bin/env rake
require "bundler/gem_tasks"

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new

namespace :spec do
  desc 'Run unit specs only'
  RSpec::Core::RakeTask.new(:unit) do |task|
    task.pattern    = 'spec'
    task.rspec_opts = '--tag "~live"'
  end

  desc 'Run acceptance specs only'
  RSpec::Core::RakeTask.new(:acceptance) do |task|
    task.pattern    = 'spec'
    task.rspec_opts = '--tag "live"'
  end
end

task :default => :spec