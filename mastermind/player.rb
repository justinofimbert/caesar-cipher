# frozen_string_literal: true

require_relative 'display'

class Player
  attr_reader :role, :is_user, :score

  include Display

  def initialize(role, is_user, score = 0)
    # string
    # is either 'codebreaker' or 'codemaker'
    @role = role

    # boolean
    # true if player instance gets input from the user, false if the player instance gets input from algorithms
    @is_user = is_user

    # number, player's score at a certain moment in time
    @score = score

    # array
    # only relevant if @role == codebreaker
    # this contains the last guess proposed by the player
    # and it also contains the hint that corresponds to that guess
    @last_guess_pair = false

    # array
    # only relevant if this player is the codebreaker and it doesn't get its input from the user
    # (aka the computer is the codebreaker)
    # we compute all the possible guesses, to start trimming them with the algorithm
    @possible_guesses = %w[1 2 3 4 5 6 7 8].permutation(4).to_a if role == 'codebreaker' && is_user == false
  end

  def is_user?
    @is_user
  end

  def create_secret_code
    unless is_user?
      secret_code = []
      available_numbers = [1, 2, 3, 4, 5, 6, 7, 8]

      4.times { secret_code.push(available_numbers.delete(available_numbers.sample)) }
      puts secret_code.join
      secret_code.join
    else
      ask_secret_code
      get_valid_code
    end
  end

  def make_guess(guess_number)
    unless is_user?
      return @possible_guesses.first.join unless last_guess_pair

      clean_possible_guesses
      @possible_guesses.first.join

    else
      if guess_number.zero?
        ask_first_guess
      else
        ask_guess
      end
      get_valid_code
    end
  end

  def increase_score
    @score += 1
  end

  private

  def get_valid_code
    loop do
      user_input = gets.chomp.split('')
      return user_input.join if user_input.length == 4 && only_numbers?(user_input) && user_input.all? { |value| value.to_i.between?(1, 8) }

      ask_errorless_code
    end
  end

  def only_numbers?(code)
    Integer code.join("") rescue false
  end

  def clean_possible_guesses(last_guess, last_guess_answer)
    
  end
end
