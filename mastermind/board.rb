class Board
  attr_reader :max_guesses

  def initialize(max_guesses)
    @max_guesses = max_guesses
  end
end