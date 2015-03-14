require('sinatra/activerecord')
require('sinatra/activerecord/rake')
require('rspec/core/rake_task')
RSpec::Core::RakeTask.new

task :default => ['db:test:prepare', :spec]

namespace(:db) do
  task(:load_config) do
    require('./app.rb')
  end
end
