# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'fileutils'
require_relative 'config/application'

Rails.application.load_tasks

namespace 'fixtures' do
  task :clean do
    puts "Cleaning fixtures/ directory"
    FileUtils.rm_rf './fixtures'
  end
end
