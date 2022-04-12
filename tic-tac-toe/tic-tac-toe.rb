class Player
  attr_reader :name, :marker

  @@markers = []

  def initialize
    @name = gets.chomp.strip
    Game.scores[self.name] = 0
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

class Match
  def initialize
    @board = Array.new(3) {Array.new(3, nil)}
  end

  def show_board
    self.board.each { |row| p row}
  end

  def player_choice(player, choice)
    choice -= 1
    self.board[choice / 3][choice % 3] = player.marker
  end

  protected
  attr_accessor :board
end