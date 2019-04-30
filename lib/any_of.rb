module MiscHelpers
  class AnyOfMatcher
    def initialize(*array)
      @array = array.flatten.uniq
    end

    def ==(other)
      match = @array.include?(other)
      @array.delete(other)
      match
    end
  end

  # @matcher any_of
  #
  # Liberal argument matcher checking received argument is belonging
  # to acceptable values.
  #
  # Example:
  #
  # ```ruby
  # expect(Something)
  #   .to receive(:something)
  #   .with(any_of(:one, :two)).exactly(2).times
  # ```
  #
  def any_of(*args)
    AnyOfMatcher.new(*args)
  end
end
