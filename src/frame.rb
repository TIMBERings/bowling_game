# Class defining a single frame of a game
class Frame
  attr_accessor :frame, :first, :second, :third, :mark, :split, :score

  def initialize(options)
    @frame = options[:frame]
    @first = options[:first]
    @second = options[:second]
    @third = options[:third]
    @strike = options[:strike]
    @spare = options[:spare]
    @split = options[:split]
  end

  def total
    @second ? @first + @second : @first
  end

  def strike?
    @first == 10
  end

  def spare?
    @first != 10 && @first + @second == 10
  end

  def open?
    !strike? && !spare?
  end
end
