ENV['ENVIRONMENT'] = 'test'

require 'rake'

Rake.application.load_rakefile

RSpec.configure do |config|

  config.before(:each) do
    Rake::Task['test_database_setup'].execute
  end
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
