class Board
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3, nil) }
    @positions_occupied = 0
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

    @positions_occupied += 1
  end

  def check_state(player)
    flat_board = board.flatten
    checks = {}

    # check in each row if an specific player has won
    checks[:row] = board.any? { |row| row.first == player.marker && row.uniq.length == 1 }

    # check in each column if an specific player has won
    3.times do |column_n|
      column = (0 + column_n..7 + column_n).step(3).map { |position| flat_board[position] }
      checks[:column] = true if column.uniq.length == 1 && column.first == player.marker
    end

    # diagonal1 is the positions from the board that go from top left to bottom right
    diagonal1 = (0..9).step(4).map { |position| flat_board[position] }
    checks[:diagonal1] = diagonal1.uniq.length == 1 && diagonal1.first == player.marker

    # diagonal2 is the positions from the board that go from top right to bottom left
    diagonal2 = (2..7).step(2).map { |position| flat_board[position] }
    checks[:diagonal2] = diagonal2.uniq.length == 1 && diagonal2.first == player.marker

    if checks.any? { |_key, value| value == true }
      reset
      return true
    end

    if @positions_occupied == 9
      reset
      puts "its a tie!"
    end

    false
  end

  private

  attr_accessor :positions_occupied

  def reset
    self.board = Array.new(3) { Array.new(3, nil) }
    @positions_occupied = 0
  end
end
