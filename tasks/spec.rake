require 'rspec/core/rake_task'

namespace :spec do
  desc 'prepares fixtures for spec examples'
  task :fixtures do
    verbose(false) do
      sh 'bundle exec rspec-puppet-init'
      FileUtils.rm_rf([
        'spec/classes',
        'spec/defines',
        'spec/functions',
        'spec/hosts'
      ])
      sh 'bundle exec librarian-puppet install --path=spec/fixtures/modules'
    end
  end

  desc 'run unit tests'
  RSpec::Core::RakeTask.new(:unit => :fixtures) do |t|
    t.pattern = 'spec/unit/*/*_spec.rb'
  end

  desc 'run integration tests'
  RSpec::Core::RakeTask.new(:integration => :fixtures) do |t|
    t.pattern = 'spec/integration/*_spec.rb'
  end
end
