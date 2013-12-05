require 'rake'
require 'rspec/core/rake_task'

Dir.glob('tasks/*.rake').each { |task| import task }

task :default => :help

desc 'Display a list of available rake tasks and their description'
task :help do
  verbose(false) do
    sh 'bundle exec rake -T'
  end
end
