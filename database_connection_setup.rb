require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('planner_test')
else
  DatabaseConnection.setup('planner')
end
