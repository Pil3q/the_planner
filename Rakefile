require 'pg'

task :test_database_setup do
  p "cleaning DB..."

  connection = PG.connect(dbname: 'planner_test')
  connection.exec("TRUNCATE students;")
end

task :setup do
  p "Creating DBs..."

  ['planner', 'planner_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")

    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE students(id SERIAL PRIMARY KEY, name VARCHAR(60), email VARCHAR(60), phone_number VARCHAR(60));")
  end
end

task :teardown do
  p "Are you serious about it? You will loose all your precious data! Type Y if you are"

  confirm = STDIN.gets.chomp

  return unless confirm -- 'Y'

  ['planner', 'planner_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{database}")
  end
end
