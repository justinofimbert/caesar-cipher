class Board
  attr_reader :max_guesses, :guess_number
  attr_accessor :secret_code

  def initialize(max_guesses)
    @max_guesses = max_guesses
  end

  def check_guess(guess)
    return_message = ''
    temp_code = @secret_code.split('')
    guess.split('').each_with_index do |guess_digit, index|

      if temp_code.include? guess_digit
        return_message += guess_digit == temp_code[index] ? 'correct position' : 'incorrect position'

      else
        return_message += 'incorrect digit'
      end
    end

    return_message
  end
end