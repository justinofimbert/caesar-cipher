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
