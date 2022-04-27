module Display
  def ask_user_name
    puts 'Hello, how may I call you?'
  end

  def ask_user_role
    puts 'Do you want to be the codebreaker?'
  end

  def ask_user_secret_code
    'You are the codemaker, you have to enter a 4-digit code where every one of its numbers is from 1 to 8'
  end

  def ask_user_errorless_code
    puts 'Oops! Remember! you have to enter a 4-digit code composed just by numbers, where every one of them is different than 0 and 9'
  end
end