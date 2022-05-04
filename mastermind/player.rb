require_relative 'display'

class Player
  attr_reader :role, :is_user, :score

  include Display

  def initialize(role, is_user, score = 0)
    @role = role
    @is_user = is_user
    @score = score
  end

  def is_user?
    @is_user
  end

  def create_secret_code
    if is_user? == false
      secret_code = []

      4.times { secret_code.push(rand(1..8)) }
      secret_code.join

    else
      ask_secret_code
      get_valid_code()
    end
  end

  def make_guess(guess_number)
    if is_user? == false

    else
      if guess_number.zero?
        ask_first_guess
      else
        ask_guess
      end
      get_valid_code
    end
  end

  def increase_score
    @score += 1
  end

  private

  def get_valid_code
    valid_code = false

    until valid_code
      user_input = gets.chomp.split('')
      if user_input.length == 4 && only_numbers?(user_input) && user_input.all? { |value| value.to_i.between?(1, 8) }
        valid_code = user_input.join
      else
        ask_errorless_code
      end
    end
  end

  def only_numbers?(code)
    Integer code.join("") rescue false
  end
end
