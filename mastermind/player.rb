# frozen_string_literal: true

require_relative 'display'

class Player
  # during each match there are two instances of the Player Class
  # there is one codebreaker and there is one codemaker
  # instances of the player class will have a value of the is_user instance variable
  # if its value is true, this means that the user will be providing the input to this instance's actions
  # if its value is false, this means that the output off this instance, will be provided by and algorithm


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
    # returns true if player instance receives input by the user, else returns false
    @is_user
  end

  def create_secret_code
    # it is expected to be used with an instance of the player class where role == 'codemaker'
    # if codemaker is user, the computer waits for the user to input a valid code
    # if codemaker is not user, the computer enters a random valid code
    # outputs string of length 4 containing digits from 1 to 8, and there is not a digit that appear twice

    # if is person do
    unless is_user?
      secret_code = []
      available_numbers = [1, 2, 3, 4, 5, 6, 7, 8]

      4.times { secret_code.push(available_numbers.delete(available_numbers.sample)) }
      puts secret_code.join
      secret_code.join

    # if is not person do
    else
      ask_secret_code
      get_valid_code
    end
  end

  def make_guess(guess_number)
    # it is expected to be used with an instance of the player class where role == 'codebreaker'
    # if codebreaker is user, the computer asks the user to input a valid guess
    # if codebreaker is not user, the computer chooses a valid guess using the swaszek's algorithm
    # outputs string of length 4 containing digits from 1 to 8, and there is not a digit that appear twice
    
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
