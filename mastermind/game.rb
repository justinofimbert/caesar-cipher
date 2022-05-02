# frozen_string_literal: true

require_relative 'display'
require_relative 'player'
require_relative 'board'

class Game
  attr_reader :user_name
  attr_accessor :board, :codebreaker, :codemaker

  include Display

  def name_player
    ask_name
    @user_name = gets.chomp
  end

  def create_board
    ask_max_guesses
    max_guesses_pairs = { 'hard' => 6, 'medium' => 8, 'easy' => 10 }
    max_guesses = 0

    until [6, 8, 10].include? max_guesses
      user_input = gets.chomp
      max_guesses = max_guesses_pairs[user_input] if max_guesses_pairs.include? user_input
    end

    @board = Board.new(max_guesses)
  end

  def define_codebreaker
    ask_role
    answer = gets.chomp

    if %w[yes y].include? answer
      @codebreaker = Player.new('codebreaker', true)

    else
      @codebreaker = Player.new('codebreaker', false)
    end
  end

  def define_codemaker
    @codemaker = codebreaker.is_user? ? Player.new('codemaker', false) : Player.new('codemaker', true)
  end

  def define_secret_code
    board.secret_code = codemaker.create_secret_code
  end
end
