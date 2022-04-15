class Game
  @@scores = {}

  def increase_score(player)
    @@scores[player.name] += 1
  end

  def self.scores
    @@scores
  end
end

class Player
  attr_reader :name, :marker

  @@markers = []

  def initialize
    @name = gets.chomp.strip
    Game.scores[name] = 0
  end

  def set_marker
    until @marker
      user_input = gets.chomp.strip
      if user_input.length == 1
        @marker = user_input
        @@markers.push(user_input)
      end
    end
  end

  def self.markers
    @@markers
  end
end

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3, nil) }
  end

  def show
    board.each { |row| p row }
  end

  def place_choice(player)
    # until player_choice is an int and is between 1 and 9 get their input and is a free space
    player_choice = false
    until player_choice.is_a?(Integer) && player_choice.between?(0, 8) && !Player.markers.include?(board.flatten[player_choice])
      player_choice = gets.chomp.strip.to_i - 1
    end

    # set player marker to its corresponding position
    board[player_choice / 3][player_choice % 3] = player.marker
  end

  def check_state(player)
    checks = {}
    # check in each row if an specific player has won
    checks[:row] = board.any? do |row|
      return true if row.unique.first == player.marker && row.unique.length == 1

      false
    end

    # check in each column if an specific player has won
    checks[:column] = 3.times do |column|
      return true if board[0][column] == player.marker && board.flatten[column..[6 + column]].step(2).unique.length == 1

      false
    end

    diagonal1 = board.flatten.step(3).unique.length == 1 && board[0][0] == player.marker

    diagonal2 = board.flatten[2..6].step(1).unique.length == 1 && board[0][2] == player.marker

    checks[:diagonals] = diagonal1 || diagonal2

    return false unless checks.any? { |_key, value| value == true }

    self.reset
    true
  end

  private

  def reset
    self.board = Array.new(3) { Array.new(3, nil) }
  end
end