ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'spec_helper'
require 'rspec/rails'
require 'simplecov'
require 'ffaker'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter
]
SimpleCov.minimum_coverage 90
SimpleCov.start

ActiveRecord::Migration.maintain_test_schema!

Capybara.javascript_driver = :webkit

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.include FactoryGirl::Syntax::Methods
  config.include Capybara::DSL, type: [:request, :feature]

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  # Uncomment the following lines if you're using Devise

  # config.include Devise::TestHelpers, type: [:controller, :feature, :routing]
  # config.include Warden::Test::Helpers

  # config.before(:suite) do
  #   Warden.test_mode!
  # end

  # config.after :each do
  #   Warden.test_reset!
  # end
end
