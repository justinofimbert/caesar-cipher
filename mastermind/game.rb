# frozen_string_literal: true

require_relative 'display'
require_relative 'player'
require_relative 'board'

class Game
  private

  attr_reader :user_name, :max_guesses
  attr_accessor :board, :codebreaker, :codemaker, :guess_number

  public

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
      @max_guesses = max_guesses_pairs[user_input] if max_guesses_pairs.include? user_input
    end

    @board = Board.new
    @guess_number = 0
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

  def play
    guess = codebreaker.make_guess
    guess_proximity = board.check_guess guess

    if guess_proximity == 'OOOO'
      display.call_codebreaker_win codebreaker.is_user?
      start_another_match(codebreaker)

    else
      display.guess_proximity_message guess_proximity
      increase_guess_number

      if guess_number == max_guesses
        display.call_codemaker_win
        start_another_match(codemaker)
      end
    end
  end

  private

  def switch_roles
    @codemaker = Player.new('codemaker', codebreaker.is_user?, codebreaker.score)
    @codebreaker = Player.new('codebreaker', codemaker.is_user?, codemaker.score)
  end

  def increase_guess_number
    @guess_number += 1
  end

  def start_another_match(winner)
    create_board
    winner.increase_score
    switch_roles
  end
end
