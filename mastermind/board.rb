class Board
  # during each match there is only one instance of the Board class
  # the Board class tracks the number of guesses that have been made
  # this is done with the @guess_number instance variable

  attr_accessor :secret_code

  def initialize
    @guess_number = 0
  end

  def create_hint(guess)
    # guess is a string of digits from 1 to 8 of length four
    guess = guess.split('')

    # hint is initiated as an empty string which will be populated later with "pegs"
    hint = ''

    # for each digit the codebreaker got right, hint is concatenated with an "O"
    correct_matches(guess).times { hint += 'O' }

    # correct_digits is the number of digits that are in guess and @secret_code
    # if we substract the number of correct_digits and correct_matches
    # we obtain the number of white pegs, or the number of digits that are not correctly placed
    white_pegs = (correct_digits(guess) - correct_matches(guess))

    # for each white peg, we concatenate an "o" with hint
    white_pegs.times { hint += 'o' }

    # 4 - correct_digits is the number of digits that the codebreaker got wrong
    no_peg = 4 - correct_digits(guess)

    # for each digit that the codebreaker got wrong, we concatenate to hint an "'"
    no_peg.times { hint += '\'' }

    hint
  end

  private

  def correct_matches(guess)
    pegs = 0
    # each digit in guess that is the same as a digit in @secret_code in the same position is correct_match
    guess.each_with_index { |current_digit, index| pegs += 1 if current_digit == @secret_code[index] }
    pegs
  end

  def correct_digits(guess)
    # each digit in guess that is included in @secret_code is a correct digit.
    guess.reduce { |pegs, current_digit| pegs + 1 if @secret_code.include? current_digit }
  end
end
