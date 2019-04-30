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

module MiscHelpers
  def any_of(*args)
    AnyOfMatcher.new(*args)
  end
end
