class Player
  attr_reader :name, :marker
  def initialize
    @name = gets.chomp.strip
  end

  def set_marker
    until @marker
      user_input = gets.chomp.strip
      if user_input.length == 1
        self.marker = user_input
      end
    end
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