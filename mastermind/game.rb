require_relative 'display.rb'
require_relative 'player.rb'
require_relative 'board.rb'

class Game
  attr_reader :user_name
  include Display

  def name_player
    Display.ask_user_name
    @user_name = gets.chomp
  end

  def new_board
    Display.ask_max_guesses
    max_guesses_pairs = {'hard' => 6, 'medium' => 8, 'easy' => 10}
    max_guesses = 0

    until [6, 8, 10].include? max_guesses
      user_input = gets.chomp
      max_guesses = max_guesses_pairs[user_input] if max_guesses_pairs.include? user_input
    end

    Board.new(max_guesses)
  end

  def define_codebreaker
    Display.ask_user_role
    answer = gets.chomp

    if ['yes', 'y'].include? answer
      return Player.new('codebreaker', true)

    else
      return Player.new('codebreaker', false)
    end
  end

  def define_codemaker(codebreaker)
    return codebreaker.is_user? ? Player.new('codemaker', false) : Player.new('codemaker', true) 
  end
end
