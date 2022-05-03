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
    return nil if role != 'codemaker'

    if is_user? == false
      secret_code = []

      4.times { secret_code.push(rand(1..8)) }
      secret_code.join

    else
      ask_secret_code
      get_valid_code()
    end
  end

  def make_guess
    if is_user? == false

    else
      ask_guess
      get_valid_code()
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
      if user_input.length == 4 && Integer(user_input) rescue false && user_input.all? { |value| value.to_i.between?(1, 8) }
        valid_code = user_input
      else
        ask_errorless_code
      end
    end
  end
end
