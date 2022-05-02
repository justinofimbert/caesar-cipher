class Board
  attr_reader :max_guesses, :guess_number
  attr_accessor :secret_code

  def initialize(max_guesses)
    @max_guesses = max_guesses
    @guess_number = 0
  end

  def check_guess(guess)
    return_string = ''
    temp_code = @secret_code.split('')
    guess = guess.split('')

    guess.each_with_index do |guess_digit, index|
      if guess_digit == temp_code[index]
        return_string += 'o'

      elsif temp_code.include? guess_digit
        return_string += '.'
      end
    end

    @guess_number += 1
    return_string
  end
end