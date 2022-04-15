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
    flat_board = board.flatten
    checks = {}

    # check in each row if an specific player has won
    checks[:row] = board.any? { |row| row.first == player.marker && row.uniq.length == 1 }

    # check in each column if an specific player has won
    3.times do |column_n|
      column = (0 + column_n...6 + column_n).step(2).map { |position| flat_board[position] }
      checks[:column] = true if column.uniq.length == 1 && column.first == player.marker
    end

    # diagonal1 is the positions from the board that go from top left to bottom right
    diagonal1 = (0...8).step(3).map { |position| flat_board[position] }
    checks[:diagonal1] = diagonal1.uniq.length == 1 && diagonal1.first == player.marker

    # diagonal2 is the positions from the board that go from top right to bottom left
    diagonal2 = (2...6).step(1).map { |position| flat_board[position] }
    checks[:diagonal2] = diagonal2.uniq.length == 1 && diagonal2.first == player.marker


    return false unless checks.any? { |_key, value| value == true }
    reset
    true
  end

  private

  def reset
    self.board = Array.new(3) { Array.new(3, nil) }
  end
end