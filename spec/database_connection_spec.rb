require 'database_connection'

describe DatabaseConnection do
  describe '#setup' do
    it 'sets up a connection with database' do
      expect(PG).to receive(:connect).with(dbname: 'planner_test')

      DatabaseConnection.setup('planner_test')
    end
  end

  describe '#query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('planner_test')

      expect(connection).to receive(:exec).with("SELECT * FROM students;")

      DatabaseConnection.query("SELECT * FROM students;")
    end
  end
end
