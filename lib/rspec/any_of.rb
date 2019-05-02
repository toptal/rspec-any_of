module RSpec
  # Provides argument matchers accepting a list of allowed arguments.
  module AnyOf
    # Liberal argument inclusion matcher.
    #
    # Example:
    #
    # ```ruby
    # expect(Something)
    #   .to receive(:something)
    #   .with(any_of(:one, :two)).exactly(2).times
    # ```
    #
    RSpec::Matchers.define :any_of do |*expected|
      description do
        "any of #{expected}"
      end

      match do |actual|
        expected.include?(actual)
      end
    end

    # Strict argument inclusion matcher. Should be used with countable qualifier.
    #
    # Example:
    #
    # ```ruby
    # expect(Something)
    #   .to receive(:something)
    #   .with(all_of(:one, :two)).twice
    # ```
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
