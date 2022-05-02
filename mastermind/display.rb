module Display
  def ask_name
    puts 'Hello, how may I call you?'
  end

  def ask_role
    puts 'Do you want to be the codebreaker?'
  end

  def ask_max_guesses
    puts "Choose the maximum number of guesses the codebreaker can make, type: \n'hard' for 6 guesses \n'medium' 8 guesses \n'easy' for 10 guesses"
  end

  def ask_secret_code
    puts 'You are the codemaker, you have to enter a 4-digit code where every one of its numbers is from 1 to 8'
  end

  def ask_errorless_code
    puts 'Oops! Remember! you have to enter a 4-digit code composed just by numbers, where every one of them is different than 0 and 9'
  end

  def ask_guess
    puts 'Make another guess! Remember! it has to be a valid 4-digit code!'
  end

  def guess_proximity_message(guess_proximity)
    puts "#{guess_proximity}"
  end

  def code_broke(is_user)
    if is_user
      puts 'Congratulations you broke the code!!'
    else
      puts 'The computer broke the code'
    end
  end
end
