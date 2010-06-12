namespace :db do
  desc "Refresh database"
  task :refresh => ["db:drop", "db:create", "db:migrate", "db:seed"]
end
