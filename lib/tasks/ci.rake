task :ci => [:spec, :cucumber]
Rake::Task["default"].clear
task :default => 'ci'
