require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :cov do
  Bundler.with_clean_env do
    system('PATH=$(npm bin):$PATH bundle exec deep-cover') || abort
  end
end
