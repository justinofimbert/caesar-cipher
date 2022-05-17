class Board
  # during each match there is only one instance of the Board class
  # the Board class tracks the number of guesses that have been made
  # this is done with the @guess_number instance variable

  attr_accessor :secret_code

  def initialize
    # a board is initialized and the @guess_number instance variable is declared with a value of 0
    @guess_number = 0
  end

  def create_hint guess
    guess = guess.split('')
    hint = ''

    correct_matches(guess).times { hint += 'O'}

    white_pegs = (correct_digits(guess) - correct_matches(guess))
    white_pegs.times { hint += 'o' }

    no_peg = 4 - correct_digits(guess)
    no_peg.times {hint += '\''}

    hint
  end

  private

  def correct_matches(guess)
    pegs = 0
    guess.each_with_index { |current_digit, index| pegs += 1 if current_digit == @secret_code[index] }
    pegs
  end

  def correct_digits(guess)
    pegs = 0
    guess.each { |current_digit| pegs += 1 if @secret_code.include? current_digit }
    pegs
  end
end
