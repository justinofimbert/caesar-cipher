require_relative 'display'

class Player
  attr_reader :role, :is_user

  include Display

  def initialize(role, is_user)
    @role = role
    @is_user = is_user
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
      secret_code = false
      until secret_code
        ask_secret_code
        user_input = gets.chomp

        if user_input.length == 4 && user_input.split('').all? { |value| value.to_i.between?(1, 8) }
          secret_code = user_input

        else
          ask_errorless_code
        end
      end
    end
  end
end
