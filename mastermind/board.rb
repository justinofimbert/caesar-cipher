class Board
  attr_accessor :secret_code

  def initialize
    @guess_number = 0
  end

  def check_guess(guess)
    return_string = ''
    temp_code = @secret_code.split('')
    guess = guess.split('')

    guess.each_with_index { |guess_digit, index| return_string += 'O' if guess_digit == temp_code[index] }

    guess.each { |guess_digit| return_string += '°' if temp_code.include? guess_digit }

    guess.each { |guess_digit| return_string += '\'' unless temp_code.include? guess_digit }

    return_string
  end
end
