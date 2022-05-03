class Board
  attr_accessor :secret_code

  def initialize
    @guess_number = 0
  end

  def check_guess(guess)
    return_string = ''
    temp_code = @secret_code.split('')
    guess = guess.split('')

    guess.each_with_index do |guess_digit, index|
      if guess_digit == temp_code[index]
        return_string += 'O' 
        temp_code.delete_at[index]
      end
    end

    guess.each { |guess_digit| return_string += '°' if temp_code.include? guess_digit }

    guess.each { |guess_digit| return_string += '\'' unless temp_code.include? guess_digit }

    return_string
  end
end
