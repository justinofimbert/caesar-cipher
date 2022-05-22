module Display
  # module included in Game and Player classes
  # used to contact with the player through the command line
  
  def explain_game
    puts "Welcome to Mastermind! \nin this game the codemaker creates a code and the codebreaker has to guess it!\nThe number of guesses(opportunities) you have depends on the chosen difficulty \nAfter each guess there will be a string of 4 markers that will signal you how close the codebreaker's guess was to the secret code \neach 'O' means that you guessed the number and position of a digit \neach '°' means that you guessed just the number and got the position wrong \neach ''' means that you got wrong a number"
  end

  def ask_name
    puts "\nHow may I call you?\n"
  end

  def ask_role
    puts "\nDo you want to be the codebreaker?\n"
  end

  def ask_max_guesses
    puts "\nChoose the maximum number of guesses the codebreaker can make, type: \n'hard' for 6 guesses \n'medium' 8 guesses \n'easy' for 10 guesses\n"
  end

  def ask_secret_code
    puts 'You are the codemaker, you have to enter a 4-digit code where every one of its numbers is from 1 to 8'
  end

  def ask_first_guess
    puts "\nThe computer has created a secret code of length 4, it is composed by digits from 1 to 8 \nYou have to guess it!"
  end

  def ask_errorless_code
    puts 'Oops! Remember! you have to enter a 4-digit code composed just by numbers, where every one of them is different than 0 and 9'
  end

  def ask_guess
    puts 'Make another guess! Remember! it has to be a valid 4-digit code!'
  end

  def hint_message(hint)
    puts hint
  end

  def call_codebreaker_win(is_user)
    if is_user
      puts 'Congratulations you broke the code!!'
    else
      puts 'The computer broke the code!'
    end
  end

  def call_codemaker_win(is_user)
    if is_user
      puts 'Congratulations! the computer wasn\'t able to crack your code!'
    else
      puts 'The computer found the secret code!'
    end
  end

  def tell_codebreaker_score(codebreaker_score, user_name = false)
    return puts "#{user_name}: #{codebreaker_score}" if user_name

    puts "Computer: #{codebreaker_score}"
  end

  def tell_codemaker_score(codemaker_score, user_name = false)
    return puts "#{user_name}: #{codemaker_score}" if user_name

    puts "Computer: #{codemaker_score}"
  end
end
