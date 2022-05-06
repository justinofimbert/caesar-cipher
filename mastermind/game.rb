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

  def initialize
    explain_game
  end

  def name_player
    ask_name
    @user_name = gets.chomp
  end

  def create_board
    ask_max_guesses
    max_guesses_pairs = { 'hard' => 6, 'medium' => 8, 'easy' => 10 }

    until @max_guesses
      user_input = gets.chomp
      @max_guesses = max_guesses_pairs[user_input] if max_guesses_pairs.include? user_input
    end

    @board = Board.new
    @guess_number = 0
  end

  def define_codebreaker
    ask_role
    answer = gets.chomp

    return @codebreaker = Player.new('codebreaker', true) if %w[yes y].include? answer

    @codebreaker = Player.new('codebreaker', false)
  end

  def define_codemaker
    @codemaker = codebreaker.is_user? ? Player.new('codemaker', false) : Player.new('codemaker', true)
  end

  def define_secret_code
    board.secret_code = codemaker.create_secret_code
  end

  def play
    guess = codebreaker.make_guess guess_number
    guess_proximity = board.check_guess guess

    if guess_proximity == 'OOOO'
      call_codebreaker_win codebreaker.is_user?
      start_another_match(codebreaker)

    else
      guess_proximity_message guess_proximity
      increase_guess_number

      if guess_number == max_guesses
        call_codemaker_win codemaker.is_user?
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
    puts "\nScores:"
    show_scores
    switch_roles
  end

  def show_scores
    if codebreaker.is_user?
      tell_codebreaker_score(codebreaker.score, user_name)
      tell_codemaker_score(codemaker.score)
    else
      tell_codemaker_score(codemaker.score, user_name)
      tell_codebreaker_score(codebreaker.score)
    end
  end
end
