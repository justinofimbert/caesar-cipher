require_relative 'display.rb'

class Game
  attr_reader :user_name
  include Display

  def name_player
    Display.ask_user_name
    @user_name = gets.chomp
  end

  def define_codebreaker
    Display.ask_user_role
    answer = gets.chomp

    if answer.include? 'y'
      return Player.new("codebreaker", true)

    else
      return Player.new("codebreaker", false)
    end
  end

  def define_codemaker(codebreaker)
    return codebreaker.is_user? ? Player.new('codemaker', false) : Player.new('codemaker', true) 
  end
end