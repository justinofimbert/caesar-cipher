class Board
  attr_reader :max_guesses, :secret_code

  def initialize(max_guesses)
    @max_guesses = max_guesses
  end

  def set_secret_code=(secret_code)
    @secret_code = secret_code
  end
end