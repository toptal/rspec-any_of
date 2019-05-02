# :nodoc:
module RSpec
  # Provides argument matchers accepting a list of allowed arguments.
  module AnyOf
    # @!method any_of(*allowed_arguments)
    #   Liberal argument inclusion matcher.
    #
    #   @param allowed_arguments [Array<Object>] allowed arguments
    #
    #   @example
    #     expect(Greeter)
    #       .to receive(:greet)
    #       .with(any_of('hello', 'good bye'))
    #
    RSpec::Matchers.define :any_of do |*expected|
      description do
        "any of #{expected}"
      end

      match do |actual|
        expected.include?(actual)
      end
    end

    # @!method all_of(*required_arguments)
    #   Strict argument inclusion matcher. Should be used with countable qualifier.
    #
    #   @param required_arguments [Array<Object>] required arguments
    #
    #   @example
    #     expect(Chat)
    #       .to receive(:message)
    #       .with(all_of('Hello', 'My name is Phil')).twice
    #
    RSpec::Matchers.define :all_of do |*expected|
      description do
        "all of #{expected}"
      end

      match do |actual|
        @expected ||= expected.dup
        expect(@expected.delete(actual)).not_to be_nil
      end
    end
  end
end
