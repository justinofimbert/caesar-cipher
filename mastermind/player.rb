class Player
  attr_reader :role, :is_user
  def initialize(role, is_user)
    @role = role
    @is_user = is_user
  end

  def is_user?
    @is_user
  end

  def create_secret_code
    return nil if self.role != codemaker 
    
    if is_user? == false
      secret_code = []

      4.times { secret_code.push(rand(8) + 1) }
      return secret_code

    else
      secret_code = false
      until secret_code
        Display.ask_user_secret_code
        user_input = gets.chomp

        if user_input.length == 4 && user_input.split('').all { |value| (value.to_i).between(1, 8) }
          secret_code = user_input

        else
          Display.ask_user_errorless_code
        end
      end
    end
  end
end
