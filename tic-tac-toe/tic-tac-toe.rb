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
      if user_input.length == 1 && !@@markers.include?(user_input)
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

game = Game.new
board = Board.new

puts 'type player 1 nickname:'
player1 = Player.new
puts "I'll refer to player 1 as #{player1.name}, now, set their marker:"
player1.set_marker
puts "#{player1.name}'s marker: #{player1.marker}"

puts 'now type player 2 nickname'
player2 = Player.new
puts "the assigned name is #{player2.name}, its now time to set their marker:"
player2.set_marker
puts "#{player2.name}'s marker: #{player2.marker}"

loop do
  board.show
  puts "#{player1.name}'s turn"
  board.place_choice(player1)
  if board.check_state(player1)
    game.increase_score(player1)
    puts "#{player1.name} won this match
    #{player1.name} has #{Game.scores[player1.name]} points
    #{player2.name} has #{Game.scores[player2.name]} points"
    redo
  end

  board.show
  puts "#{player2.name}'s turn"
  board.place_choice(player2)
  if board.check_state(player2)
    game.increase_score(player2)
    puts "#{player2.name} won this match
    #{player1.name} has #{Game.scores[player1.name]} points
    #{player2.name} has #{Game.scores[player2.name]} points"
    redo
  end
end
