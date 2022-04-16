require_relative 'game.rb'
require_relative 'board.rb'
require_relative 'player.rb'

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
