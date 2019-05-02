$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'rspec/any_of'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!
  config.warnings = true
  config.order = :random
  Kernel.srand config.seed

  def fail_with(*messages)
    raise_error(RSpec::Mocks::MockExpectationError, a_string_including(*messages))
  end

  # Reset prevents the matcher under test failure from being reported.
  config.after(:each, :reset) do
    RSpec::Mocks.space.proxy_for(receiver).reset
  end

  config.include RSpec::AnyOf
end
